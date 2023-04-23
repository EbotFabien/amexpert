from flask import Flask,render_template,url_for,flash,redirect,request,Blueprint,make_response,send_from_directory,jsonify
from Database_project.project.data_base_.Models import db,Facturation_libre,Client,Expert,Client_History,Expert_History,Facturation_avoir,facturation_client
from Database_project.project.data_base_ import create_app
from Database_project.project.data_base_.forms import facturation_libre,facturation_avoir
from flask_login import login_user,current_user,logout_user,login_required,LoginManager
from sqlalchemy import or_, and_, desc,asc
#from flask_wkhtmltopdf import Wkhtmltopdf
import os
import base64

fact_a =Blueprint('fact_a',__name__)

app= create_app()

wkhtmltopdf =2#Wkhtmltopdf(app)



@fact_a.route('/facture/libre/link/<int:id>/' , methods=['GET','POST'])
@login_required
def linkavoir(id):
    return redirect(url_for('fact_a.createavoir', id=id)) 

@fact_a.route('/facture/libre/<int:id>/' , methods=['GET','POST'])
@login_required
def createavoir(id):
    if current_user:
        form = facturation_avoir()
        facture=facturation_client.query.filter_by(id=id).first()
        data = Client.query.filter_by(id=facture.client).first()
        data_his = Client_History.query.filter_by(client_id=facture.client).first()
        
        print(form.data)
        if form.validate_on_submit():
            
            Facturation=Facturation_avoir(identite=facture.client,
                type_phys = 'factureclient',
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
            return redirect(url_for('fact_a.voisavoir2'))
    return render_template('manage/pages/createfacture_avoir.html',form=form,data=data,his=data_his,nro=facture.n_facture)


@fact_a.route('/vois/facture/avoir' , methods=['GET','POST'])
@login_required
def voisavoir():
    db.create_all()
    facture=Facturation_avoir.query.filter(Facturation_avoir.type_phys!='factureclient').all()
    return render_template('manage/pages/tous_facture_avoir.html',data=facture)

@fact_a.route('/vois/facture/avoir/client' , methods=['GET','POST'])
@login_required
def voisavoir2():
    db.create_all()
    facture=Facturation_avoir.query.filter(Facturation_avoir.type_phys=='factureclient').all()
    return render_template('manage/pages/tous_facture_avoir.html',data=facture)

@fact_a.route('/vois/facture/<int:id>/avoir',methods=['GET','POST'])
@login_required
def fact_indi(id):
    facture=Facturation_avoir.query.filter_by(id=id).first()
    return render_template('manage/pages/factur_avoir_indivi.html',facture=facture)


@fact_a.route('/impri/facture/<int:id>/avoir',methods=['GET','POST'])
@login_required
def impri_avoir(id):
    facture=Facturation_avoir.query.filter_by(id=id).first()
    img=os.path.join('/work/www/AmexpertDoc/amexpert/Database_project/project/data_base_/', 'static', 'images','logo',"logo.png")
    with open(img, 'rb') as image_file:
            image= base64.b64encode(image_file.read()).decode()
    
    res=wkhtmltopdf.render_template_to_pdf('manage/pages/print_avoir.html', download=True, save=False,image=image,facture=facture)
    return res



