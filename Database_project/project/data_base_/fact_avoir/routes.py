from flask import Flask,render_template,url_for,flash,redirect,request,Blueprint,make_response,send_from_directory,jsonify
from Database_project.project.data_base_.Models import db,Facturation_libre,Client,Expert,Client_History,Expert_History,Facturation_avoir,facturation_client
from Database_project.project.data_base_ import create_app
from Database_project.project.data_base_.forms import facturation_libre
from flask_login import login_user,current_user,logout_user,login_required,LoginManager
from sqlalchemy import or_, and_, desc,asc
from flask_wkhtmltopdf import Wkhtmltopdf
import os
import base64

fact_a =Blueprint('fact_a',__name__)

app= create_app()

wkhtmltopdf =Wkhtmltopdf(app)

@fact_a.route('/search/facture', methods=['GET'])
@login_required
def search_fact():
    db.create_all()
    if current_user.TYPE == 'Admin':
        table = request.args.get('table')
        search = "%{}%".format(request.args.get('keyword'))
        key=request.args.get('keyword')
        key=request.args.get('keyword')
        if table == 'client':
            client = facturation_client.query.filter(or_(facturation_client.Montant_HT==,facturation_client.Date_de_creation==,facturation_client.n_facture==)).first()
            if client is not None:
                return redirect(url_for('fact_a.createavoir',id=client.id)) 
            
            else:
                flash(f"Cette facture  n'existe pas, assurez-vous qu'il est correct",'warning')

                return redirect(url_for('fact_a.search_fact')) 
        
    return render_template('manage/pages/client_facture_avoir.html')


@fact_a.route('/facture/libre/<int:id>/' , methods=['GET','POST'])
@login_required
def createavoir(id):
    if current_user:
        form = facturation_libre()
        facture=facturation_client.query.filter_by(id=id).first()
        data = Client.query.filter_by(id=facture.client).first()
        data_his = Client_History.query.filter_by(client_id=facture.client).first()
        
        
        if form.validate_on_submit():
            
            Facturation=Facturation_avoir(identite=facture.client,
                type_phys = 'client',
                identite_fact=id,
                no_fact = form.facture.data,
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
                
                montant_ht =form.montant_ht.data,
                montant_rem =form.montant_rem.data,
                prix_uni =form.prix_uni.data,
                datepaye=form.datepaye.data,
                type_paye = form.type_paye.data
            )
            db.session.add(Facturation)
            db.session.commit()
            
            #flash(f"Vous avez modifier avec success",'success')
            return redirect(url_for('fact_a.voisavoir'))
    return render_template('manage/pages/createfacture_avoir.html',form=form,data=data,his=data_his,nro=facture.no_fact)


@fact_a.route('/vois/facture/avoir' , methods=['GET','POST'])
@login_required
def voisavoir():
    db.create_all()
    facture=Facturation_avoir.query.all()
    return render_template('manage/pages/tous_facture_avoir.html',data=facture)

@fact_a.route('/vois/facture/<int:id>/libre',methods=['GET','POST'])
@login_required
def fact_indi(id):
    facture=Facturation_avoir.query.filter_by(id=id).first()
    return render_template('manage/pages/factur_libre_indivi.html',facture=facture)


@fact_a.route('/impri/facture/<int:id>/libre',methods=['GET','POST'])
@login_required
def fact_impri(id):
    facture=Facturation_avoir.query.filter_by(id=id).first()
    img=os.path.join('/work/www/AmexpertDoc/amexpert/Database_project/project/data_base_/', 'static', 'images','logo',"logo.png")
    with open(img, 'rb') as image_file:
            image= base64.b64encode(image_file.read()).decode()
    res=wkhtmltopdf.render_template_to_pdf('manage/pages/pint_libre.html', download=True, save=False,image=image,facture=facture)
    return res
