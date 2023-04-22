from flask import Flask,render_template,url_for,flash,redirect,request,Blueprint,make_response,send_from_directory,jsonify
from Database_project.project.data_base_.Models import db,Facturation_libre,Client,Expert,Client_History,Expert_History,Facturation_avoir
from Database_project.project.data_base_ import create_app
from Database_project.project.data_base_.forms import facturation_libre,facturation_avoir
from flask_login import login_user,current_user,logout_user,login_required,LoginManager
from sqlalchemy import or_, and_, desc,asc
from flask_wkhtmltopdf import Wkhtmltopdf
import os
import base64



fact_l =Blueprint('fact_l',__name__)

app= create_app()

wkhtmltopdf =Wkhtmltopdf(app)

@fact_l.route('/search/facture', methods=['GET'])
@login_required
def search_fact():
    db.create_all()
    if current_user.TYPE == 'Admin':
        table = request.args.get('table')
        search = "%{}%".format(request.args.get('keyword'))
        key=request.args.get('keyword')
        if table == 'client':
            client = Client.query.filter(and_(or_(Client.nom.contains(str(search)),Client.prenom.contains(str(search)),Client.email.contains(str(search)),Client.numero.contains(str(search)),Client.societe.contains(str(search))),Client.visibility==True)).first()
            if client is not None:
                return redirect(url_for('fact_l.createlibre',Type="client",id=client.id)) 
            
            else:
                flash(f"Ce prestataire n'existe pas, assurez-vous qu'il est correct",'warning')

                return redirect(url_for('fact_l.search_fact')) 
        
        elif table == 'expert':
             
            expert = Expert.query.filter(and_(or_(Expert.nom.contains(search),Expert.prenom.contains(str(search)),Expert.email.contains(search),Expert.TYPE.contains(search)),Expert.visibility==True)).all()
            if expert is not None:
                return redirect(url_for('fact_l.createlibre',Type="expert",id=expert.id))
            else:
                flash(f"Ce prestataire n'existe pas, assurez-vous qu'il est correct",'warning')

                return redirect(url_for('fact_l.search_fact'))
    return render_template('manage/pages/client_facture_libre.html')


@fact_l.route('/search/facture/avoir', methods=['GET'])
@login_required
def search_facta():
    db.create_all()
    if current_user.TYPE == 'Admin':
        search = request.args.get('keyword')
        print(search)
        if search !=None:
            client1 = Facturation_libre.query.filter_by(no_fact=search).first()
            if client1:
                return render_template('manage/pages/List_Facture.html',mission=client1)
                
            else:
                flash(f"Cette facture  n'existe pas, assurez-vous qu'il est correct",'warning')

                return redirect(url_for('fact_l.search_facta')) 
        
    return render_template('manage/pages/client_facture_avoir.html')



@fact_l.route('/facture/libre/<int:id>/<string:Type>' , methods=['GET','POST'])
@login_required
def createlibre(id,Type):
    if current_user:
        form = facturation_libre()
        if Type == "client":
            data = Client.query.filter_by(id=id).first()
            data_his = Client_History.query.filter_by(id=id).first()
        if Type == "expert":
            data = Expert.query.filter_by(id=id).first()
            data_his = Expert_History.query.filter_by(client_id=id).first()
        
        if form.validate_on_submit():
            
            Facturation=Facturation_libre(identite=id,
                type_phys = Type,
                no_fact = " ",
                tri = form.trigramme.data,
                civilite = form.civilite.data,
                numero = form.numero.data,
                nom = form.nom.data,
                prenom = form.prenom.data,
                email = form.email.data,
                cp = form.cp.data,
                ville = form.ville.data,
                adresse = form.adresse.data,
                type_prest = form.type_prest.data,
                quantite = form.quantite.data,
                ref_commande = form.ref_commande.data,
                intitule = form.intitule.data,
                remise = form.remise.data,
                details = form.details.data,
                description=form.description.data,
                lien_paiement=form.lien_paiement.data,
                
                montant_ht =form.montant_ht.data,
                montant_rem =form.montant_rem.data,
                prix_uni =form.prix_uni.data,
                datepaye=form.datepaye.data,
                type_paye = form.type_paye.data
            )
            db.session.add(Facturation)
            db.session.commit()
            date=str(Facturation.datefact)
            if Facturation.id <=9:
                fact=str(date[2:4])+'0000'+str(Facturation.id)+'-001'
            if Facturation.id >9:
                fact=str(date[2:4])+'000'+str(Facturation.id)+'-001'
            Facturation.no_fact="ADI"+fact   
            db.session.commit()
            #flash(f"Vous avez modifier avec success",'success')
            return redirect(url_for('fact_l.voislibre'))
    return render_template('manage/pages/createfacture_libre.html',form=form,data=data,his=data_his,typo=Type)

@fact_l.route('/facture/libre/avoir/link/<int:id>/' , methods=['GET','POST'])
@login_required
def linkavoir(id):
    return redirect(url_for('fact_l.createavoir', id=id)) 

@fact_l.route('/facture/libre/avoir/<int:id>/' , methods=['GET','POST'])
@login_required
def createavoir(id):
    if current_user:
        form =facturation_avoir()
        facture=Facturation_libre.query.filter_by(id=id).first()
        if facture.type_phys == "client":
            data = Client.query.filter_by(id=facture.identite).first()
            data_his = Client_History.query.filter_by(client_id=facture.identite).first()
        if facture.type_phys == "expert":
            data = Expert.query.filter_by(id=facture.identite).first()
            data_his = Expert_History.query.filter_by(client_id=facture.identite).first()
        
        
        if form.validate_on_submit():
            
            Facturation=Facturation_avoir(identite=facture.identite,
                type_phys = facture.type_phys,
                identite_fact=id,
                no_fact = form.facture.data,
                civilite = form.civilite.data,
                numero = form.numero.data,
                nom = form.nom.data,
                prenom = form.prenom.data,
                email = form.email.data,
                cp = form.cp.data,
                ville = form.ville.data,
                adresse = form.adresse.data,
                quantite = form.quantite.data,
                intitule = form.intitule.data,
                lien_paiement=form.lien_paiement.data,
                description=form.description.data,
                societe = form.societe.data,
                tva = form.tva.data,
                siret = form.siret.data,
                
                montant_ht =form.montant_ht.data,
                prix_uni =form.prix_uni.data,
                type_paye = form.type_paye.data
            )
            db.session.add(Facturation)
            db.session.commit()
            
            #flash(f"Vous avez modifier avec success",'success')
            return redirect(url_for('fact_a.voisavoir'))
    return render_template('manage/pages/createfacture_avoir.html',form=form,data=data,his=data_his,nro=facture.no_fact)



@fact_l.route('/vois/facture/libre' , methods=['GET','POST'])
@login_required
def voislibre():
    db.create_all()
    facture=Facturation_libre.query.all()
    return render_template('manage/pages/tous_facture_libre.html',data=facture)



@fact_l.route('/vois/facture/<int:id>/libre',methods=['GET','POST'])
@login_required
def fact_indi(id):
    facture=Facturation_libre.query.filter_by(id=id).first()
    return render_template('manage/pages/factur_libre_indivi.html',facture=facture)

@fact_l.route('/impri/facture/<int:id>/libre',methods=['GET','POST'])
@login_required
def fact_impri(id):
    facture=Facturation_libre.query.filter_by(id=id).first()
    img=os.path.join('/work/www/AmexpertDoc/amexpert/Database_project/project/data_base_/', 'static', 'images','logo',"logo.png")
    with open(img, 'rb') as image_file:
            image= base64.b64encode(image_file.read()).decode()
    res=wkhtmltopdf.render_template_to_pdf('manage/pages/pint_libre.html', download=True, save=False,image=image,facture=facture)
    return res

