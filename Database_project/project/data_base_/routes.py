from flask import Flask,render_template,url_for,flash,redirect,request,Blueprint
from Database_project.project.data_base_.Models import db,Tarifs,Mission,Client,Expert,Agenda,Facturation,Expert_History,Client_History,Client_negotiateur,Negotiateur_History,suivi_client,prospect,prospect_History,prospect,suivi_client,suivi_prospect,facturation_client,facturation_mission,Tarif_base,Facturation_history
from Database_project.project.data_base_.forms import (RegistrationForm, Mission_editForm, LoginForm ,tableform,Client_Form,Facturation_Form, Tarif_Form,RequestResetForm,ResetPasswordForm,Suivi_Client,Expert_editForm,Mission_add,Invitation_Agenda,time,Tarif_Base,Agenda_form,Negotiateur_Form,Tarif_edit)
from Database_project.project.data_base_ import bcrypt
from Database_project.project.data_base_.data  import Missions,expert__,insert_client,tarif_client,fix_mission,Base,reset
from Database_project.project.data_base_.utils import send_reset_email
from sqlalchemy import or_, and_, desc,asc
from flask_login import login_user,current_user,logout_user,login_required,LoginManager
import os
from Database_project.project.data_base_ import create_app
from os.path import join, dirname, realpath
from datetime import date,timedelta,datetime

users =Blueprint('users',__name__)
app= create_app()

PER_PAGE = 10

@users.route('/client', methods=['GET', 'POST'])
@login_required
def client():
    global PER_PAGE
    global Ord
    Ord="a"
    db.create_all()
    if current_user.TYPE == "Admin":
        client_=Client.query.filter_by(visibility=True).order_by(asc(Client.id)).all()
        # page = request.args.get('page', 1, type=int)
        #     form_data = request.form
        #     order = request.form.get('order')
        #     f = request.form.get('filter')
        #     if f is not None:
        #         PER_PAGE = int(f)
        #         Ord =order
    
        # if Ord == "asc":
        #     client_=Client.query.filter_by(visibility=True).order_by(asc(Client.id)).paginate(page=page, per_page=PER_PAGE)
        # if Ord == "desc":
        #     client_=Client.query.filter_by(visibility=True).order_by(desc(Client.id)).paginate(page=page, per_page=PER_PAGE)
        # else:
        #     client_=Client.query.filter_by(visibility=True).order_by(asc(Client.id)).paginate(page=page, per_page=PER_PAGE)
        return render_template('manage/pages/client.html',cli_ent=client_,legend="client", highlight='client')
    return redirect(url_for('users.main'))
 
@users.route('/ajouter/client',methods=['GET','POST'])
@login_required
def ajouter_client():
    if current_user.TYPE == "Admin":
        form=Client_Form()
        if form.validate_on_submit():
            user=Client(TYPE=form.Type.data,societe=form.Societe.data,sexe=form.Sexe.data,nom=form.NOM.data,email=form.email.data,numero=form.Numero.data,siret=form.Siret.data)
            db.session.add(user)
            db.session.commit()
            user_history=Client.query.filter(or_(Client.email == form.email.data,Client.nom == form.NOM.data)).first()
            user_his=Client_History(client_id=user_history.id,adresse=form.Adresse.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(user_his)
            db.session.commit()
            flash(f'Client créé avec succès','success')
            return redirect(url_for('users.client'))
        print("didn't validate on submit")    
        return render_template('manage/pages/ajouter_client.html',form=form,legend="client", highlight='client')
    else:
        return redirect(url_for('users.main'))

@users.route('/suivi/<int:id>/client')
@login_required
def suivi_client_(id):
    if current_user.TYPE == "Admin":
        suivi_=list(suivi_client.query.filter(and_(suivi_client.client==id,suivi_client.visibility==True)).all())
        cli=Client.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/suivi_c.html',Suivi=suivi_,ID=id,legend="client",highlight='client',cli=cli)

    return redirect(url_for('users.main'))

@users.route('/ajouter/<int:id>/suivi_client',methods=['GET','POST'])
@login_required
def ajouter_suivic(id):
    if current_user.TYPE == "Admin":
        form=Suivi_Client()
        client = Client.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            suivi=suivi_client(client.id,current_user.id,form.commentaire.data)
            db.session.add(suivi) 
            db.session.commit()
            flash(f'suivi Client créé avec succès','success')
            return redirect(url_for('users.suivi_client_', id=id))
        return render_template('manage/pages/ajouter_suivi.html',form=form,ID=id,legend="client", highlight='client')
    #return function 

@users.route('/delete/<int:id>/suivi_client', methods=['GET'])
@login_required
def delete_suivi(id):
    if current_user.TYPE == "Admin":
        suivi = suivi_client.query.filter_by(id=id).first_or_404()
        suivi.visibility=False
        db.session.commit()
        flash(f'Le suivi client a été  suprimmer','success')
        return redirect(url_for('users.suivi_client_', id=suivi.client))
    return redirect(url_for('users.client'))

@users.route('/edit/<int:id>/suivi_client', methods=['GET'])
@login_required
def edit_suivi(id):
    if current_user.TYPE == "Admin":
        form = Suivi_Client()
        suivi = suivi_client.query.filter_by(id=id).first_or_404()
        if current_user.id == suivi.responsable:
            return render_template('manage/pages/edit_suivi.html', suivi=suivi,form=form)
        else:
            flash(f'Vous ne pouvez pas modifier ce suivi','warning')
            return redirect(url_for('users.suivi_client_', id=suivi.client))
    return redirect(url_for('users.client'))

@users.route('/update/<int:id>/suivi_client', methods=['POST', 'PUT'])
@login_required
def update_suivi(id):
    if current_user.TYPE == 'Admin':
        suivi = suivi_client.query.filter_by(id=id).first_or_404()
        suivi.commentaire = request.form['commentaire']
        db.session.commit()
        flash(f'Le suivi a été modifiées','success')
        return redirect(url_for('users.suivi_client_', id=suivi.client))
    return redirect(url_for('users.client'))

@users.route('/show/<int:id>/client', methods=['GET'])
@login_required
def show_client(id):
    if current_user.TYPE == "Admin":
        client = Client.query.filter_by(id=id).first_or_404()
        client_history=Client_History.query.filter_by(client_id=id).order_by(asc(Client_History.date)).first_or_404()
        client_Tarif=Tarifs.query.filter_by(reference_client=id).first_or_404()
        return render_template('manage/pages/show_client.html', client=client,history=client_history,legend="client",tarif=client_Tarif, highlight='client')



@users.route('/delete/<int:id>/client', methods=['GET'])
@login_required
def delete_client(id):
    if current_user.TYPE == "Admin":
        client = Client.query.filter_by(id=id).first_or_404()
        client_history=list(Client_History.query.filter_by(client_id=id).all())
        client.visibility=False
        db.session.commit()
        for i in client_history:
            i.visibility=False
            db.session.commit()
        flash(f'Les donnes du client ont été  suprimmer','success')
        return redirect(url_for('users.client'))

@users.route('/edit/<int:id>/client', methods=['GET'])
@login_required
def edit_client(id):
    if current_user.TYPE == "Admin":
        form = Client_Form()
        client = Client.query.filter_by(id=id).first_or_404()
        client_history=Client_History.query.filter_by(client_id=id).order_by(asc(Client_History.date)).first_or_404()
        return render_template('manage/pages/edit_client.html', highlight='client', client=client,history=client_history,form=form,legend="client")

@users.route('/update/<int:id>/client', methods=['POST','GET'])
@login_required
def update_client(id):
    if current_user.TYPE == "Admin":
        client = Client.query.filter_by(id=id).first_or_404()
        if request.form['Ville'] or  request.form['Pays'] or request.form['CP'] or  request.form['Adresse'] :
            client_check=Client_History(client_id=id)
            db.session.add(client_check)
            db.session.commit()
            client_history=Client_History.query.filter_by(client_id=id).order_by(asc(Client_History.date)).first_or_404()
            client_history.ville = request.form['Ville']
            client_history.pays = request.form['Pays']
            client_history.cp = request.form['CP']
            client_history.adresse = request.form['Adresse']
            db.session.commit()
            

        client.email = request.form['email']
        client.societe = request.form['Societe']
        client.numero = request.form['Numero']
        client.sexe = request.form['Sexe']
        client.TYPE = request.form['Type']
        client.nom = request.form['NOM']
        db.session.commit()
        flash(f'Informations client modifiées','success')
        return redirect(url_for('users.client', id=id))
    return redirect(url_for('users.edit_client', id=id))
       





@users.route('/mission')
@login_required
def mission():
    if current_user.TYPE == "Admin":
        mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.id)).all()
        return render_template('manage/pages/mission.html',Mission=mission_,legend="mission", highlight='mission')

    return redirect(url_for('users.main'))

@users.route('/choose/<int:id>/<string:Type>/mission',methods=['GET','POST'])
@login_required
def choose(Type,id=None):
    if current_user.TYPE == "Admin":
        form=time()
        form2=Facturation_Form()
        if form.validate_on_submit():  
            start=datetime.combine(form.Demarrer.data,datetime.min.time())
            end=datetime.combine(start+timedelta(days=30),datetime.min.time())
            price=list()
            if Type == "client":
                mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=start,Mission.DATE_REALISE_EDL<=end,Mission.Reference_BAILLEUR==id,Mission.NRO_FACTURE==None)).order_by(asc(Mission.id)).all())#check query
            
           # if Type == "single":
              #  mission_=list(Mission.query.filter(and_(Mission.id==id,Mission.DATE_REALISE_EDL>=start,Mission.DATE_REALISE_EDL<=end,Mission.NRO_FACTURE==None)).order_by(asc(Mission.id)).all())
            if mission_ == price:
                flash(f'cette date a deja ete facture','success')
                return redirect(url_for('users.choose',id=id))
            if mission_:
                for mission in mission_:
                   
                    if mission.CODE_FACTURATION is None:

                        flash(f'SVP Generez une code  Facturation pour cette mission','success')
                        return redirect(url_for('users.show_mission',id=mission.id))

                    else:
                        
                        if mission.CODE_FACTURATION[0:2] == 'TS':
                            price.append(mission.CODE_FACTURATION[3:-1])
                        if mission.CODE_FACTURATION[0:2] == 'TN':
                        
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '1'   :
                                
                                tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                                if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                    meuble=float(tarif.edl_appt_prix_f1)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f1) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                    
                                else:
                                    
                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f1
                                    db.session.commit()
                                    price.append(float(tarif.edl_appt_prix_f1))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '2':
                                #print('APPT 2')
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':#check print
                                    meuble=float(tarif.edl_appt_prix_f2)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f2) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f2
                                    db.session.commit()
                                    price.append(float(tarif.edl_appt_prix_f2))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '3':
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':#check print
                                    meuble=float(tarif.edl_appt_prix_f3)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f3) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f3
                                    db.session.commit()
                                    price.append(float(tarif.edl_appt_prix_f3))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '4':
                                
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':#check print
                                    meuble=float(tarif.edl_appt_prix_f4)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f4) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f4
                                    db.session.commit()
                                    price.append(float(tarif.edl_appt_prix_f4))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '5':
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':#check print
                                    meuble=float(tarif.edl_appt_prix_f5)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f5) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f5
                                    db.session.commit()
                                    price.append(float(tarif.edl_appt_prix_f5))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '6':
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':#check print
                                    meuble=float(tarif.edl_appt_prix_f6)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f6) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f6
                                    db.session.commit()
                                    price.append(float(tarif.edl_appt_prix_f6))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '7':
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':#check print
                                    meuble=float(tarif.EDL_APPT_prix_F7)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f7) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f7
                                    db.session.commit()
                                    price.append(float(tarif.edl_appt_prix_f7))

                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '1' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':
                                    meuble=float(tarif.edl_pav_villa_prix_t1)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t1) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t1
                                    db.session.commit()
                                    price.append(float(tarif.edl_pav_villa_prix_t1))
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '2' :
                                
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':
                                    meuble=float(tarif.edl_pav_villa_prix_t2)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t2) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t2
                                    db.session.commit()
                                    price.append(float(tarif.edl_pav_villa_prix_t2))
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '3' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':
                                    meuble=float(tarif.edl_pav_villa_prix_t3)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t3) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t3
                                    db.session.commit()
                                    price.append(float(tarif.edl_pav_villa_prix_t3))
                        
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '4' :
                                
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':
                                    meuble=float(tarif.edl_pav_villa_prix_t4)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t4) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t4
                                    db.session.commit()
                                    price.append(float(tarif.edl_pav_villa_prix_t4))
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '5' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':
                                    meuble=float(tarif.edl_pav_villa_prix_t5)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t5) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t5
                                    db.session.commit()
                                    price.append(float(tarif.edl_pav_villa_prix_t5))
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '6' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':
                                    meuble=float(tarif.edl_pav_villa_prix_t6)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t6) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t6
                                    db.session.commit()
                                    price.append(float(tarif.edl_pav_villa_prix_t6))#goes up to 8  '''
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '7' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':
                                    meuble=float(tarif.edl_pav_villa_prix_t7)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t7) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t7
                                    db.session.commit()
                                    price.append(float(tarif.edl_pav_villa_prix_t6))#goes up to 8  '''
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '8' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if mission.CODE_FACTURATION[2:5] == '150':
                                    meuble=float(tarif.edl_pav_villa_prix_t8)/2
                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t8) + float(meuble)
                                    db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                else:
                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t8
                                    db.session.commit()
                                    price.append(float(tarif.edl_pav_villa_prix_t8))#goes up to 8  '''

                   
                add_sum=sum(price)
                if Type == "client":
                    return render_template('manage/pages/ajouter_facturationc.html', mission=mission_,form=form2,sum=add_sum,start=start,end=end)
            else:
                flash(f'choisisez une date existante','danger')
                return redirect(url_for('users.choose',id=id))
        return render_template('manage/pages/choose.html',form=form,legend="time")

    return redirect(url_for('users.main'))

#route to correct and fix broken routes for client and mission combined
# for m in mission_:failed=list()
               # check=Facturation_history.query.filter_by(mission=m.id).first()
               # if check:
               #     failed.append(check)
                #check=Facturation_history.query.filter_by(mission=mission.id).first()
                    #if check:
                       # check.visibility=False
                       # db.session.commit() 




@users.route('/create_facturec/',methods=['GET','POST'])
@login_required
def create_facturec():
    if current_user.TYPE == "Admin":
        form=Facturation_Form()
        
        
        _mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.NRO_FACTURE==None,Mission.Visibility==True,Mission.coherent==False,Mission.Reference_BAILLEUR==request.form['Reference_client'])).order_by(desc(Mission.id)).all())
        mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.NRO_FACTURE==None,Mission.Visibility==True,Mission.coherent==True,Mission.Reference_BAILLEUR==request.form['Reference_client'])).order_by(desc(Mission.id)).all())#check query

        
            
        if mission_:
           
            facture=facturation_client(Montant_HT=request.form['Montant_HT'],Statut=request.form['Statut'],Date_mission=request.form['Demarrer'],client=request.form['Reference_client'])
            db.session.add(facture)
            db.session.commit()
            factura=str(facture.Date_de_creation)
            facture.n_facture=str(facture.id)+'-'+str(factura[2:4])+str(factura[5:7])+'-C'
            db.session.commit()
            for i in mission_:
                print(i.id)
                i.NRO_FACTURE = facture.n_facture
                i.DATE_FACTURE = facture.Date_de_creation
                if _mission_:
                    for m in _mission_:
                        check=Facturation_history.query.filter_by(mission=m.id).first()
                        if check is None:
                            failed=Facturation_history(date=request.form['Demarrer'],mission=m.id,facture=facture.id)
                            db.session.add(failed)
                            db.session.commit()
                fact_m=facturation_mission(ref_mission=i.id,fact_mission=facture.id)
                db.session.add(fact_m)
                db.session.commit()
            

            
            return redirect(url_for('users.facturation',id=request.form['Reference_client']))
        else:
            flash(f'Erreur de Codification ','warning')
            return redirect(url_for('users.facturation',id=request.form['Reference_client']))
    return redirect(url_for('users.main'))




@users.route('/show/<int:id>/fac', methods=['GET'])
@login_required
def show_fac(id):
    if current_user.TYPE == "Admin":
        abnormal =list()
        facture = list(facturation_mission.query.filter_by(fact_mission=id).all())
        
        for i in facture:
            if i.mission__data_.Anomalie == True:
                abnormal.append(i)
                facture.remove(i)
        failed = list(Facturation_history.query.filter(and_(Facturation_history.facture==id,Facturation_history.visibility==True)).all())
        
        return render_template('manage/pages/show_facture.html', facture=facture,failed=failed,abnormal=abnormal)

@users.route('/client/<int:id>/mission')
@login_required
def client_mission(id):
    if current_user.TYPE == "Admin":
        mission_=list(Mission.query.filter(and_(Mission.Visibility==True,Mission.Reference_BAILLEUR==id,Mission.NRO_FACTURE==None)).order_by(desc(Mission.id)).all())
        return render_template('manage/pages/client_mission.html',missions=mission_,legend="mission", highlight='mission')# design a page for clients to see missions by their mission id and date only
    
    return redirect(url_for('users.main'))

@users.route('/client/<int:id>/facture')
@login_required
def facturation(id):
    if current_user.TYPE == "Admin":
        facturation=list(facturation_client.query.filter(and_(facturation_client.client==id,facturation_client.visibility==True)).all())#add visibility
        failed = list(Facturation_history.query.filter(and_(Facturation_history.facture==facturation[0].id,Facturation_history.visibility==True)).all())
        fac=facturation_mission.query.filter_by(fact_mission=facturation[0].id).all()
        abnormal =list()
        facture = list(facturation_mission.query.filter_by(fact_mission=facturation[0].id).all())
        
        for i in facture:
            if i.mission__data_.Anomalie == True:
                abnormal.append(i)
        f=len(failed)
        s=len(fac)
        a=len(abnormal)
        return render_template('manage/pages/facturation.html',legend="facturation",facturations=facturation,f=f,s=s,a=a, highlight="facturation") 
#shows all the factures of the clients,make a page that will show all the data of this particular table
    return redirect(url_for('users.main'))


@users.route('/facture')
@login_required
def facturationa():
    if current_user.TYPE == "Admin":
        facturation=list(facturation_client.query.order_by(desc(facturation_client.id)).all())#add visibility
        return render_template('manage/pages/facturationa.html',legend="facturation",facturations=facturation) 
#shows all the factures of the clients,make a page that will show all the data of this particular table
    return redirect(url_for('users.main'))

@users.route('/facture/choisim')
@login_required
def choosem():
    if current_user.TYPE == "Admin":
        form=Facturation_Form()
        if form.validate_on_submit():  
            start=datetime.combine(form.Demarrer.data,datetime.min.time())
            facture=facturation_client.query.filter_by(Date_mission=start).all()
            return render_template('manage/pages/facturationm.html',legend="facturation",facturations=facture)

@users.route('/show/<int:id>/fac', methods=['GET'])
@login_required
def show_facm(id):
    if current_user.TYPE == "Admin":
        facture = facturation_mission.query.filter_by(fact_mission=id).all()
        failed = Facturation_history.query.filter(and_(Facturation_history.facture==id,Facturation_history.visibility==True)).all()
        return render_template('manage/pages/show_facture.html', facture=facture,failed=failed)

@users.route('/delete/<int:id>/facturation', methods=['GET'])
@login_required
def delete_facturation(id):
    if current_user.TYPE == 'Admin':
        fact = facturation_client.query.filter_by(id=id).first_or_404()
        mission = facturation_mission.query.filter_by(fact_mission=id).first_or_404()
        fact.visibility=False
        mission.visibility=False
        db.session.commit()
        flash(f'Les donnes de la facture  ont été  suprimmer','success')
        return redirect(url_for('users.mission'))



@users.route('/show/<int:id>/mission', methods=['GET'])
@login_required
def show_mission(id):
    if current_user.TYPE == "Admin":
        mission = Mission.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/show_mission.html', mission=mission,legend="show_mission",highlight='mission')



@users.route('/ajouter/mission',methods=['GET','POST'])
@login_required
def ajouter_mission():
    if current_user.TYPE == 'Admin':
        form=Mission_add()
        if form.validate_on_submit():
            check=Client.query.filter_by(reference=form.Reference_client.data).first()
            ID_=Expert.query.filter_by(id=int(form.ID_Concessionaire.data)).first()
            if check and ID_.id:
                mission=Mission(check.id,0,ID_.id,0,0,
                0,0,0,0,0,0,
                0,0,0,0,0,0,0,
                0,0,0,0,0,0,
                0,0,0,0,0,0,
                0,0,0,0,0,0,
                0,0,0,0,0,0,
                0,0,
                0,0,0,0,0,0,
                0,0,0,0,0,0,
                0,0,0,0,0,0,
                0,0,0,
                0,0,0)

                db.session.add(mission)
                db.session.commit()
                return redirect(url_for('users.mission'))
            else:
                flash(f"Le client ou expert n'existe pas dans cette base",'danger')
                return redirect(url_for('users.ajouter_mission'))
        return render_template('manage/pages/add_mission.html',form=form, legend="mission",highlight='mission')

@users.route('/edit/<int:id>/mission', methods=['GET'])
@login_required
def edit_mission(id):
    if current_user.TYPE == 'Admin':
        form = Mission_editForm()

        mission = Mission.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/edit_mission.html', form=form,mission=mission,highlight='mission')

@users.route('/update/<int:id>/mission', methods=['POST', 'PUT'])
@login_required
def update_mission(id):
    if current_user.TYPE == 'Admin':
        form = Mission_editForm()
        mission = Mission.query.filter_by(id=id).first_or_404()

        mission.TYPE_LOGEMENT = request.form['TYPE_LOGEMENT']
        mission.LOGEMENT_MEUBLE = request.form['LOGEMENT_MEUBLE']
        mission.CODE_FACTURATION = request.form['CODE_FACTURATION']
        mission.TYPE_DE_BIEN = request.form['TYPE_DE_BIEN']
        '''mission.NRO_FACTURE = request.form['NRO_FACTURE']
        mission.DATE_REALISE_EDL = request.form['DATE_REALISE_EDL']
        mission.PRIX_HT_EDL = request.form['PRIX_HT_EDL']
        mission.TVA_EDL = request.form['TVA_EDL']
        mission.PRIX_TTC_EDL = request.form['PRIX_TTC_EDL']
        mission.ID_INTERV = request.form['ID_INTERV']
        mission.Reference_LOCATAIRE = request.form['Reference_LOCATAIRE']
        mission.CA_HT_AS = request.form['CA_HT_AS']
        mission.TVA_AS = request.form['TVA_AS']
        mission.CA_TTC_AS = request.form['CA_TTC_AS']
        mission.CA_HT_AC = request.form['CA_HT_AC']
        mission.CA_TTC_AC = request.form['CA_TTC_AC']
        mission.CA_HT_TRUST = request.form['CA_HT_TRUST']
        mission.TVA_TRUST = request.form['TVA_TRUST']
        mission.Date_chiffrage_regle = request.form['Date_chiffrage_regle']
        mission.Prix_ht_chiffrage = request.form['Prix_ht_chiffrage'] 
        mission.POURCENTAGE_suiveur_chiffrage = request.form['POURCENTAGE_suiveur_chiffrage']
        mission.POURCENTAGE_AS_chiffrage = request.form['POURCENTAGE_AS_chiffrage']
        mission.POURCENTAGE_manager_chiffrage = request.form['POURCENTAGE_manager_chiffrage']
        mission.ID_manager_chiffrage = request.form['ID_manager_chiffrage']
        mission.POURCENTAGE_agent_chiffrage = request.form['POURCENTAGE_agent_chiffrage']
        mission.ID_agent_chiffrage = request.form['ID_agent_chiffrage']
        mission.TYPE_EDL = request.form['TYPE_EDL']
        mission.DATE_FACTURE = request.form['DATE_FACTURE']
        mission.NOMPROPRIO  = request.form['NOMPROPRIO']
        mission.DATE_FACT_REGLEE = request.form['DATE_FACT_REGLEE']
        mission.DATE_COM_REGLEE_AS = request.form['DATE_COM_REGLEE_AS']
        mission.MONTANT_COM_REGLEE_AS = request.form['MONTANT_COM_REGLEE_AS ']
        mission.DATE_COM_REGLEE_AC  = request.form['DATE_COM_REGLEE_AC']
        mission.MONTANT_COM_REGLEE_AC = request.form['MONTANT_COM_REGLEE_AC']
        mission.NBRE_EDL_ABOONEMENT = request.form['NBRE_EDL_ABOONEMENT']
        mission.MAIL_CONTACT_ENVOI_FACT = request.form['MAIL_CONTACT_ENVOI_FACT']
        mission.DATE_saisie_enregistrement = request.form['DATE_saisie_enregistrement']
        mission.CODE_AMEXPERT = request.form['CODE_AMEXPERT']
        mission.COMMENTAIRE_FACTURE = request.form['COMMENTAIRE_FACTURE']
        mission.TYPE_PAIEMENT = request.form['TYPE_PAIEMENT']
        mission.N_REMISE_DE_CHEQUE = request.form['N_REMISE_DE_CHEQUE']
        mission.SAISIE_TRAITE_PAR = request.form['SAISIE_TRAITE_PAR']
        mission.infos_et_TRAITEMENT = request.form['infos_et_TRAITEMENT']
        mission.LOGEMENT_MEUBLE = request.form['LOGEMENT_MEUBLE']
        mission.CODE_FACTURATION = request.form['CODE_FACTURATION']
        mission.TYPE_DE_BIEN = request.form['TYPE_DE_BIEN']
        mission.surface_logement1  = request.form['surface_logement1']
        mission.ETAGE = request.form['ETAGE']
        mission.POINTAGE = request.form['POINTAGE']
        mission.DATE_POINTAGE = request.form['DATE_POINTAGE']
        mission.DEVEL = request.form['DEVEL']
        mission.DATE_EXTRACTION_COMPTABLE  = request.form['DATE_EXTRACTION_COMPTABLE']
        mission.POURCENTAGE_COM_AS_DU_CLIENT = request.form['POURCENTAGE_COM_AS_DU_CLIENT']
        mission.ID_Respon_Cell_Dev = request.form['ID_Respon_Cell_Dev']
        mission.POURCENTAGE_Respon_Cell_Dev = request.form['POURCENTAGE_Respon_Cell_Dev']
        mission.ID_agent_Cell_Dev = request.form['ID_agent_Cell_Dev']
        mission.POURCENTAGE_Agent_Cell_Dev = request.form['POURCENTAGE_Agent_Cell_Dev']
        mission.ID_Agent_CellTech = request.form['ID_Agent_CellTech']
        mission.POURCENTAGE_Agent_Cell_Tech = request.form['POURCENTAGE_Agent_Cell_Tech']
        mission.ID_Respon_Cell_Tech  = request.form['ID_Respon_Cell_Tech']
        mission.POURCENTAGE_Respon_Cell_Tech = request.form['POURCENTAGE_Respon_Cell_Tech']
        mission.ID_Suiveur_Cell_Tech = request.form['ID_Suiveur_Cell_Tech']
        mission.POURCENTAGE_Suiveur_Cell_Tech = request.form['POURCENTAGE_Suiveur_Cell_Tech']
        mission.ID_Respon_Cell_Planif = request.form['ID_Respon_Cell_Planif']
        mission.POURCENTAGE_Respon_Cell_Planif = request.form['POURCENTAGE_Respon_Cell_Planif']
        mission.ID_Suiveur_Cell_Planif = request.form['ID_Suiveur_Cell_Planif']
        mission.POURCENTAGE_Suiveur_Cell_Planif	 = request.form['POURCENTAGE_Suiveur_Cell_Planif']
        mission.ID_Agent_saisie_Cell_Planif = request.form['ID_Agent_saisie_Cell_Planif']
        mission.POURCENTAGE_Agent_saisie_CEll_planif = request.form['POURCENTAGE_Agent_saisie_CEll_planif'] '''

        db.session.commit()
        
        flash(f"Les information de l\'expert a ete modifier", "success")
        return redirect(url_for('users.mission'))
    return redirect(url_for('users.main'))   

@users.route('/delete/<int:id>/mission', methods=['GET'])
@login_required
def delete_mission(id):
    if current_user.TYPE == 'Admin':
        mission = Mission.query.filter_by(id=id).first_or_404()
        mission.Visibility=False
        db.session.commit()
        flash(f'Les donnes de mission ont été  suprimmer','success')
        return redirect(url_for('users.mission'))


@users.route('/expert')
@login_required
def expert():
    if current_user.TYPE == "Admin":
        page = request.args.get('page', 1, type=int)
        expert_=Expert.query.filter_by(visibility=True).order_by(asc(Expert.id)).all()
        return render_template('manage/pages/expert.html',Expert=expert_, legend="expert", highlight='expert')

    return redirect(url_for('users.main'))

@users.route('/show/<int:id>/expert', methods=['GET'])
@login_required 
def show_expert(id):
    if current_user.TYPE == "Admin":
        expert = Expert.query.filter_by(id=id).first_or_404()
        client_history=Expert_History.query.filter_by(expert_id=id).order_by(asc(Expert_History.date)).first_or_404()
        return render_template('manage/pages/show_expert.html', expert=expert,history=client_history,legend="expert",highlight='expert')


@users.route('/ajouter/expert',methods=['GET','POST'])
@login_required
def ajouter_expert():
    if current_user.TYPE == 'Admin':
        form = RegistrationForm()
        if form.validate_on_submit():
            hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
            user=Expert(sexe=form.Sexe.data,nom=form.username.data,numero=form.Numero.data,TYPE=form.Type_Expert.data, email=form.email.data)
            db.session.add(user)
            db.session.commit()
            expert_check=Expert_History(expert_id=user.id)#check if tables are modified from table expert_history
            db.session.add(expert_check)
            user.password=hashed_password
            db.session.commit()
            return redirect(url_for('users.expert'))
        return render_template('manage/pages/ajouter_expert.html',form=form, legend="expert", highlight='expert')
    else:
        return redirect(url_for('users.main'))



@users.route('/edit/<int:id>/expert', methods=['GET'])
@login_required
def edit_expert(id):
    if current_user.TYPE == 'Admin':
        form = Expert_editForm()
        expert = Expert.query.filter_by(id=id).first_or_404()
        expert_history=Expert_History.query.filter_by(expert_id=id).order_by(asc(Expert_History.date)).first_or_404()
        return render_template('manage/pages/edit_expert.html', highlight='expert', form=form,history=expert_history,expert=expert)

@users.route('/delete/<int:id>/expert', methods=['GET'])
@login_required
def delete_expert(id):
    if current_user.TYPE == 'Admin':
        expert = Expert.query.filter_by(id=id).first_or_404()
        client_history=list(Expert_History.query.filter_by(expert_id=id).all())
        expert.visibility=False
        db.session.commit()
        for i in client_history:
            i.visibility=False
            db.session.commit()
        flash(f'Les donnes de l"expert ont été  suprimmer','success')
        return redirect(url_for('users.expert'))

@users.route('/update/<int:id>/expert', methods=['POST', 'PUT'])
@login_required
def update_expert(id):
    if current_user.TYPE == 'Admin':
        form = Expert_editForm()
        expert = Expert.query.filter_by(id=id).first_or_404()
        print(47)
        if request.form['ville'] !=None: #or  request.form['type_certification'] !="None" or request.form['adresse'] !="None" or  request.form['cp'] !="None" or request.form['login_backof'] !="None" or request.form['pwd_backof'] !="None" or request.form['login_extranet'] !="None" or request.form['pwd_extranet'] !="None" or request.form['pwd_gsuite'] !="None" or request.form['observations_de_suivi'] !="None" :
        
            expert_check=Expert_History(expert_id=id)
            db.session.add(expert_check)
            db.session.commit()
            expert_history=Expert_History.query.filter_by(expert_id=id).order_by(asc(Expert_History.date)).first_or_404()
            expert_history.ville = request.form['ville']
            
            expert_history.type_certification =  request.form['type_certification']
            
            expert_history.cp = request.form['cp']
            expert_history.actif_parti  = request.form['actif_parti']
            
            expert_history.login_backof = request.form['login_backof']
            expert_history.pwd_backof = request.form['pwd_backof']
            
            expert_history.adresse = request.form['adresse']
            expert_history.login_extranet = request.form['login_extranet']
            expert_history.pwd_extranet = request.form['pwd_extranet']
            
            expert_history.pwd_gsuite = request.form['pwd_gsuite']
            expert_history.observations_de_suivi = request.form['observations_de_suivi']
            
            db.session.commit()
      
        expert.sexe= request.form['Sexe']
        expert.nom = request.form['username']
        expert.numero = request.form['Numero']
        expert.email = request.form['email']
        expert.siret= request.form['siret']
        expert.trigramme=request.form['trigramme']
        db.session.commit()

        flash(f'Les information de l\'expert a ete modifier', 'success')
        return redirect(url_for('users.expert'))
    return redirect(url_for('users.main'))

@users.route('/tarifs')
@login_required
def tarif_base():
    if current_user.TYPE == "Admin":
        tarifs=list(Tarif_base.query.filter_by(visibility=True).order_by(asc(Tarif_base.id)).all())
        return render_template('manage/pages/tarif_base.html',legend="tarifs",tarifs=tarifs, highlight='tarif_base')

    return redirect(url_for('users.main'))

@users.route('/edit/<int:id>/tarifb', methods=['GET'])
@login_required
def edit_tarifb(id):
    if current_user.TYPE == 'Admin':
        form = Tarif_edit()
        Tarif = Tarif_base.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/edit_tb.html', highlight='expert', form=form,Tarif=Tarif)


@users.route('/update/<int:id>/tarifb', methods=['POST', 'PUT'])
@login_required
def update_tarifb(id):
    if current_user.TYPE == 'Admin':
        tarif = Tarif_base.query.filter_by(id=id).first_or_404()
        tarif.Prix_EDL=request.form['prix']    
        tarif.surface=request.form['surface']
        
        db.session.commit()
        flash(f'Les donnes du tarif a été modifiées','success')
        return redirect(url_for('users.tarif_base'))
    return redirect(url_for('users.edit_tarifb', id=id))


@users.route('/ajouter/tarifs')
@login_required
def tarif_ajouter():
    if current_user.TYPE == "Admin":
        form=Tarif_Base()
        if form.validate_on_submit():
            tarif=Tarif_base(maison_appartement=form.maison_appartement.data,Type=form.Nombre_de_piece.data,Prix_EDL=form.Prix_EDL.data,Prix_Chiffrage=form.Prix_Chiffrage.data)
            db.session.add(tarif)
            db.session.commit()
            flash(f'Le tarif de base a été créé avec succès', 'success')
            return redirect(url_for('users.tarif_base'))
        return render_template('manage/pages/ajouter_tarif.html',form=form, legend="tarif", highlight='tarif')
    return redirect(url_for('users.main'))
         

@users.route('/client/<int:id>/tarifs')
@login_required
def tarifs(id):
    if current_user.TYPE == "Admin":
        tarifs=list(Tarifs.query.filter(and_(Tarifs.reference_client==id,Tarifs.visibility==True)).all())
        return render_template('manage/pages/tarif.html',legend="tarifs",tarifs=tarifs, highlight='tarifs')

    return redirect(url_for('users.main'))

@users.route('/show/<int:id>/tarifs', methods=['GET'])
@login_required 
def show_tarif(id):
    if current_user.TYPE == "Admin":
        tarif_ = Tarifs.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/show_tarif.html', tarif=tarif_,legend="tarif", highlight='tarif')



@users.route('/client/<int:id>/ajouter/tarifs/', methods=['GET','POST'])
@login_required
def ajouter_tarif(id):
    if current_user.TYPE == 'Admin':
        form = Tarif_Form()
        client = Client.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            if form.validate_price_STD(form.edl_prix_std.data):
                print('ok5')
            tarif = Tarifs(reference_client=client.id,edl_prix_std=form.edl_prix_std.data,edl_appt_prix_f1=form.edl_appt_prix_f1.data,edl_appt_prix_f2=form.edl_appt_prix_f2.data,edl_appt_prix_f3=form.edl_appt_prix_f3.data,edl_appt_prix_f4=form.edl_appt_prix_f4.data,edl_appt_prix_f5=form.edl_appt_prix_f5.data,edl_appt_prix_f6=form.edl_appt_prix_f6.data,edl_pav_villa_prix_t1=form.edl_pav_villa_prix_t1.data,edl_pav_villa_prix_t2=form.edl_pav_villa_prix_t2.data
            ,edl_pav_villa_prix_t3=form.edl_pav_villa_prix_t3.data,edl_pav_villa_prix_t4=form.edl_pav_villa_prix_t4.data,edl_pav_villa_prix_t5=form.edl_pav_villa_prix_t5.data,edl_pav_villa_prix_t6=form.edl_pav_villa_prix_t6.data,edl_pav_villa_prix_t7=form.edl_pav_villa_prix_t7.data,edl_pav_villa_prix_t8=form.edl_pav_villa_prix_t8.data,chif_appt_prix_stu=form.chif_appt_prix_stu.data,chif_appt_prix_f1=form.chif_appt_prix_f1.data,chif_appt_prix_f2=form.chif_appt_prix_f2.data,
            chif_appt_prix_f3=form.chif_appt_prix_f3.data,chif_appt_prix_f4=form.chif_appt_prix_f4.data,chif_appt_prix_f5=form.chif_appt_prix_f5.data,chif_pav_villa_prix_t1=form.chif_pav_villa_prix_t1.data,chif_pav_villa_prix_t2=form.chif_pav_villa_prix_t2.data,chif_pav_villa_prix_t3=form.chif_pav_villa_prix_t3.data,chif_pav_villa_prix_t4=form.chif_pav_villa_prix_t4.data,chif_pav_villa_prix_t5=form.chif_pav_villa_prix_t5.data,
            chif_pav_villa_prix_t6=form.chif_pav_villa_prix_t6.data,chif_pav_villa_prix_t7=form.chif_pav_villa_prix_t7.data,chif_pav_villa_prix_t8=form.chif_pav_villa_prix_t8.data,code_tva=form.code_tva.data,referent_as_client=form.referent_as_client.data,com_as_sur_ca_client=form.com_as_sur_ca_client.data,cell_dev_ref_responsable=form.cell_dev_ref_responsable.data,prix_autre=form.prix_autre.data,taux_meuble=form.taux_meuble.data,
            com_cell_dev_ref_responsable=form.com_cell_dev_ref_responsable.data,cell_dev_ref_agent=form.cell_dev_ref_agent.data,com_cell_dev_ref_agent=form.com_cell_dev_ref_agent.data,cell_tech_ref_agent=form.cell_tech_ref_agent.data,com_cell_tech_Ref_agent=form.com_cell_tech_Ref_agent.data,
            cell_tech_ref_responsable=form.cell_tech_ref_responsable.data,com_cell_tech_ref_responsable=form.com_cell_tech_ref_responsable.data,cell_tech_ref_suiveur=form.cell_tech_ref_suiveur.data,com_cell_tech_ref_suiveur=form.com_cell_tech_ref_suiveur.data,cell_planif_ref_responsable=form.cell_planif_ref_responsable.data,
            com_cell_planif_ref_responsable=form.com_cell_planif_ref_responsable.data,cell_planif_ref_suiveur=form.cell_planif_ref_suiveur.data,com_cell_planif_ref_suiveur=form.com_cell_planif_ref_suiveur.data,cell_planif_ref_agent_saisie=form.cell_planif_ref_agent_saisie.data,com_cell_planif_ref_agent_saisie=form.com_cell_planif_ref_agent_saisie.data,
            commentaire_libre=form.commentaire_libre.data,chif_appt_prix_f6=form.chif_appt_prix_f6.data)
            db.session.add(tarif)
            #db.session.commit()
            flash(f'Le tarif a été créé avec succès', 'success')
            return redirect(url_for('users.tarifs',id=id))
        return render_template('manage/pages/ajouter_tarif.html',form=form, legend="expert", highlight='tarif')
    return redirect(url_for('users.main'))


@users.route('/delete/<int:id>/tarif')
@login_required
def delete_tarif(id):
    if current_user.TYPE == "Admin":
        tarif = Tarifs.query.filter_by(id=id).first_or_404()
        tarif.visibility = False
        db.session.commit()
        flash(f'Les donnes de Tarifs ont été  suprimmer','success')
        return redirect(url_for('users.tarifs'))

@users.route('/edit/<int:id>/tarif')
@login_required
def edit_tarif(id):
    if current_user.TYPE == "Admin":
        form = Tarif_Form()
        tarif = Tarifs.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/edit_tarif.html', expert=tarif,form=form, highlight='tarif')

@users.route('/update/<int:id>/tarif', methods=['POST', 'PUT'])
@login_required
def update_tarif(id):
    if current_user.TYPE == 'Admin':
        tarif = Tarifs.query.filter_by(id=id).first_or_404()
        tarif.edl_prix_std=request.form['edl_prix_std']    
        tarif.edl_appt_prix_f1=request.form['edl_appt_prix_f1']
        tarif.edl_appt_prix_f2=request.form['edl_appt_prix_f2']
        tarif.edl_appt_prix_f3=request.form['edl_appt_prix_f3']
        tarif.edl_appt_prix_f4 =request.form['edl_appt_prix_f4']
        tarif.edl_appt_prix_f5=request.form['edl_appt_prix_f5']
        tarif.edl_appt_prix_f6=request.form['edl_appt_prix_f6']
        tarif.edl_pav_villa_prix_t1=request.form['edl_pav_villa_prix_t1']
        tarif.edl_pav_villa_prix_t2=request.form['edl_pav_villa_prix_t2']
        tarif.edl_pav_villa_prix_t3=request.form['edl_pav_villa_prix_t3']
        tarif.edl_pav_villa_prix_t4=request.form['edl_pav_villa_prix_t4']
        tarif.edl_pav_villa_prix_t5=request.form['edl_pav_villa_prix_t5']
        tarif.edl_pav_villa_prix_t6=request.form['edl_pav_villa_prix_t6']
        tarif.edl_pav_villa_prix_t7=request.form['edl_pav_villa_prix_t7']
        tarif.edl_pav_villa_prix_t8=request.form['edl_pav_villa_prix_t8']
        tarif.chif_appt_prix_stu=request.form['chif_appt_prix_stu']
        tarif.chif_appt_prix_f1 =request.form['chif_appt_prix_f1']
        tarif.chif_appt_prix_f2  =request.form['chif_appt_prix_f2']
        tarif.chif_appt_prix_f3  =request.form['chif_appt_prix_f3']
        tarif.chif_appt_prix_f4  =request.form['chif_appt_prix_f4']
        tarif.chif_appt_prix_f5=request.form['chif_appt_prix_f5']
        tarif.chif_appt_prix_f6  =request.form['chif_appt_prix_f6']
        tarif.chif_pav_villa_prix_t1=request.form['chif_pav_villa_prix_t1']
        tarif.chif_pav_villa_prix_t2 =request.form['chif_pav_villa_prix_t2']
        tarif.chif_pav_villa_prix_t3=request.form['chif_pav_villa_prix_t3']
        tarif.chif_pav_villa_prix_t4=request.form['chif_pav_villa_prix_t4']
        tarif.chif_pav_villa_prix_t5=request.form['chif_pav_villa_prix_t5']
        tarif.chif_pav_villa_prix_t6=request.form['chif_pav_villa_prix_t6']
        tarif.chif_pav_villa_prix_t7=request.form['chif_pav_villa_prix_t7']
        tarif.chif_pav_villa_prix_t8=request.form['chif_pav_villa_prix_t8']
        tarif.prix_autre=request.form['prix_autre']

        tarif.code_tva=request.form['code_tva']

        tarif.taux_meuble=request.form['taux_meuble']

        tarif.referent_as_client=request.form['ID_Cell_AS_referent_client']

        tarif.com_as_sur_ca_client=request.form['com_as_sur_ca_client']

        tarif.cell_dev_ref_responsable =request.form['cell_dev_ref_responsable']

        tarif.com_cell_dev_ref_responsable=request.form['com_cell_dev_ref_responsable'] 

        tarif.cell_dev_ref_agent =request.form['cell_dev_ref_agent']

        tarif.com_cell_dev_ref_agent =request.form['com_cell_dev_ref_agent']

        tarif.cell_tech_ref_agent  =request.form['cell_tech_ref_agent ']

        tarif.com_cell_tech_Ref_agent =request.form['com_cell_tech_Ref_agent']

        tarif.cell_tech_ref_responsable =request.form['cell_tech_ref_responsable']

        tarif.com_cell_tech_ref_responsable =request.form['com_cell_tech_ref_responsable']

        tarif.cell_tech_ref_suiveur =request.form['cell_tech_ref_suiveur']

        tarif.com_cell_tech_ref_suiveur =request.form['com_cell_tech_ref_suiveur']

        tarif.cell_planif_ref_responsable =request.form['cell_planif_ref_responsable']

        tarif.com_cell_planif_ref_responsable =request.form['com_cell_planif_ref_responsable']

        tarif.cell_planif_ref_suiveur =request.form['cell_planif_ref_suiveur']

        tarif.com_cell_planif_ref_suiveur =request.form['com_cell_planif_ref_suiveur']

        tarif.cell_planif_ref_agent_saisie =request.form['cell_planif_ref_agent_saisie']

        tarif.com_cell_planif_ref_agent_saisie =request.form['com_cell_planif_ref_agent_saisie']

        tarif.commentaire_libre =request.form['commentaire_libre']
        
        db.session.commit()
        flash(f'Les donnes du tarif a été modifiées','success')
        return redirect(url_for('users.tarifs'))
    return redirect(url_for('users.edit_tarif', id=id))
       



@users.route('/agendas')
@login_required
def agendas():
    if current_user.TYPE == "Admin"  or current_user.TYPE == "Audit":
        agenda = Agenda.query.all()
        return render_template('manage/pages/edit_agenda.html', agendas=agenda,  highlight='agendas')



@users.route('/client/<int:id>/agenda')
@login_required
def agenda(id):
    if current_user.TYPE == "Audit":
        #agenda_=list(Agenda.query.filter(_and(Agenda.client_id==id,Agenda.visibility=True)).all())
        return render_template('manage/pages/agenda.html',legend="agenda",Agenda=agenda_, highlight='agenda') #correct

    return redirect(url_for('users.main'))

@users.route('/show/<int:id>/agenda', methods=['GET'])
@login_required 
def show_agenda(id):
    if current_user.TYPE == "Admin":
        tarif_ = Agenda.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/show_agenda.html', tarif=tarif_,legend="agenda", highlight='agenda')


@users.route('/ajoutez/<int:id>/agenda')
@login_required
def ajouter_agenda (id):
    if current_user.TYPE == "Admin"  or current_user.TYPE == "Audit":
        form = Agenda_form()
        if form.validate_on_submit():#fix data
            agenda=Agenda(client_id=id,Organisateur=current_user.id,
            Titre_du_Rdv=form.Titre_du_Rdv.data,Adresse1_Rdv=form.Adresse1_Rdv.data,
            Adresse2_Rdv=form.Adresse2_Rdv.data,Code_postal_Rdv=form.Code_postal_Rdv.data,
            Ville_du_Rdv=form.Ville_du_Rdv.data,Date_Rdv=form.Date_Rdv.data,Heure_début_Rdv=form.Heure_début_Rdv.data,
            Heure_fin_Rdv=form.Heure_fin_Rdv.data,Date_Rdv_annulé=form.Date_Rdv_annulé.data,
            Informations_réservées_service_planification=form.Informations_réservées_service_planification.data,
            Informations_générales=form.Informations_générales.data,Informations_de_suivi_de_Rdv=form.Informations_de_suivi_de_Rdv.data,
            Chemin_de_fichier_joint=form.Chemin_de_fichier_joint.data)
            
            db.session.add(agenda)
            db.session.commit()
            flash(f'Agenda du client a ete ajouter','success')
            return redirect(url_for('users.ajouter_agenda',id=id))
        return render_template('manage/pages/ajouter_agenda.html', legend="agenda", highlight='agenda')

    return redirect(url_for('users.main'))

@users.route('/edit/<int:id>/agenda')
@login_required
def edit_agenda(id):
    if current_user.TYPE == "Admin"  or current_user.TYPE == "Audit":
        form = Agenda_form()
        tarif = Tarifs.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/edit_agenda.html', tarif=tarif,form=form, highlight='agenda')

@users.route('/update/<int:id>/agenda', methods=['POST', 'PUT'])
@login_required
def update_agenda(id):
    if current_user.TYPE == "Admin"  or current_user.TYPE == "Audit":
        agenda = Agenda.query.filter_by(id=id).first_or_404()
        agenda.Titre_du_Rdv=request.form['Titre_du_Rdv']
        agenda.Adresse1_Rdv=request.form['Adresse1_Rdv']
        agenda.Adresse2_Rdv=request.form['Adresse2_Rdv']
        agenda.Code_postal_Rdv=request.form['Code_postal_Rdv']
        agenda.Ville_du_Rdv=request.form['Ville_du_Rdv']
        agenda.Date_Rdv=request.form['Date_Rdv']
        agenda.Heure_début_Rdv=request.form['Heure_début_Rdv']
        agenda.Heure_fin_Rdv=request.form['Heure_fin_Rdv']
        agenda.Date_Rdv_annulé =request.form['Date_Rdv_annulé']
        agenda.Informations_réservées_service_planification=request.form['Informations_réservées_service_planification']
        agenda.Informations_générales =request.form['Informations_générales']
        agenda.Informations_de_suivi_de_Rdv=request.form['Informations_de_suivi_de_Rdv']
        agenda.Chemin_de_fichier_joint=request.form['Chemin_de_fichier_joint']
        
        db.session.commit()
        flash(f'Les donnes du tarif a été modifiées','success')
        return redirect(url_for('users.agenda'))
    return redirect(url_for('users.edit_agenda', id=id))


@users.route('/invite/<int:id>/agenda')
@login_required
def invite_agenda(id):
    if current_user.TYPE == "Admin"  or current_user.TYPE == "Audit":
        form = Invitation_Agenda()
        if form.validate_on_submit():

            agenda = Agenda_expert(agenda_taken=id ,Participant_invité=form.Expert_invite.data)
            db.session.add(user)
            db.session.commit()
            flash(f"L'invitation a été envoyes","success")# you need to send a mail
            return redirect(url_for('users.agenda'))

        return render_template('manage/pages/edit_agenda.html', tarif=tarif,form=form, highlight='agenda')


@users.route('/delete/<int:id>/agenda', methods=['GET'])
@login_required
def delete_agenda(id):
    if current_user.TYPE == "Admin":
        agenda = Agenda.query.filter_by(id=id).first_or_404()
        participants=list(Agenda_expert.query.filter_by(agenda_taken=id).all())
        agenda.visibility=False
        db.session.commit()
        for i in participants:
            i.visibility=False
            db.session.commit()
        flash(f"Les donnes de l'agenda ont été  suprimmer",'success')
        return redirect(url_for('users.negotiateur', id=id))










@users.route('/sign_up',methods=['GET','POST'])
def sign_up():
    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user=Expert(titre=form.Titre.data,nom=form.username.data,numero=form.Numero.data,Type=form.Type_Expert.data, email=form.email.data )
        db.session.add(user)
        db.session.commit()
        user.password=hashed_password
        db.session.commit()
        flash(f'Account created you can now login','success')
        return redirect(url_for('users.login'))
    return render_template('signup.html',legend="sign_up",form=form)


@users.route('/login',methods=['GET','POST'])
def login():

    #expert=Expert('Mr.','Admin','Admin','test0001@gmail.com','1234567')
    #db.session.add(expert)
    #db.session.commit()
    #expert=Expert.query.filter_by(nom="Admin").first()
    #expert.TYPE="Admin"
    #hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    #expert.password = hashed_password
    #db.session.commit()
    #db.drop_all()
    #db.create_all()
    #expert1=Expert(genre='0',nom='0',numero=0,TYPE='0', email='0' )
    #expert=Expert(genre='Mr.',nom='Admin',numero=12345,TYPE='Admin', email='test0001@gmail.com' )
    #db.session.add(expert1)
    #db.session.add(expert)
    #db.session.commit()
    #expert1.id =0
   # hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
   # expert.password=hashed_password
   # db.session.commit()

    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    form = LoginForm()
    if form.validate_on_submit():
        name=Expert.query.filter_by(nom=form.username.data).first()
        if  name and bcrypt.check_password_hash(name.password,form.password.data):
            login_user(name)
            next_page=request.args.get('next')
            return redirect (next_page) if next_page else  redirect(url_for('users.main'))
        else:
            flash(f'Mauvais e-mail ou mot de passe, essayez à nouveau','danger')

    return render_template('signup.html',legend="login",form=form)

@users.route('/forgot_password', methods=['GET','POST'])
def forgot_password ():
    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    form = RequestResetForm()
    if form.validate_on_submit():
        expert=Expert.query.filter_by(EMAIL=form.email.data).first()
        if expert:
            send_reset_email(expert)
            flash('An email has been sent with instructions to reset your Password.','info')
            return redirect(url_for('users.login'))
        if expert is None:
            flash('This email does not exist','warning')
            return redirect(url_for('users.forgot_password'))
    return render_template('forgot_password.html', form=form)

@users.route('/reset_password/<token>', methods=['GET','POST'])
def reset_password (token):
    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    expert = Expert.verify_reset_token(token)
    if expert is None:
        flash('That is an invalid or expired token','warning')
        return redirect(url_for('users.forgot_password'))
    form = ResetPasswordForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        expert.password = hashed_password
        db.session.commit()
        flash(f'your password has been updated! You are now able to login','success')
        return redirect(url_for('users.login'))
    return render_template('reset_password.html', form=form)

@users.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('users.login'))



@users.route('/ajoutez/agenda', methods = ['GET', 'POST'])
def ajout_agenda(): 
    if request.method == 'POST':
        print('ok1')
        client = Client.query.get(request.form.get('id'))
        #expert_audit=Expert.query.filter(and_(Expert.NOM == str(current_user.NOM), Expert.TYPE =='audit_planner')).first() #type='audit_planner'
     #   agen=Agenda(client.id,int(request.form['Audit_planner']),int(request.form['Agent_referent'])
     #   request.form['Lieu'],request.form['Date'])
     #   db.session.add(agen)
     #   db.session.commit()
      #  return redirect(url_for('users.agenda'))
    return render_template('manage/pages/ajouter_agenda.html', legend="agenda", highlight='agenda')
    #return redirect(url_for('users.client'))


@users.route('/',methods=['GET','POST'])
@login_required
def main():
    if current_user.is_authenticated:
        clients = Client.query.all()
        missions = list(Mission.query.all())
        facturations = list(Facturation.query.all())
        form = tableform()
        expert_admin=Expert.query.filter(and_(Expert.nom == str(current_user.nom), Expert.TYPE =='Admin')).first() #type='admin'
        expert_concess=Expert.query.filter(and_(Expert.nom == str(current_user.nom), Expert.TYPE =='CONCESS')).first() #type='Concess'
        expert_audit=Expert.query.filter(and_(Expert.nom == str(current_user.nom), Expert.TYPE =='audit_planner')).first() #type='audit_planner'
    # hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    # expert_admin.password = hashed_password
        #db.session.commit()

        # clients=list(Client.query.all())
        
        if current_user.is_authenticated and  expert_admin :
            if form.validate_on_submit:
                data=form.table.data
                if data == "mission":
                    return redirect(url_for('users.mission'))
                if data == "client":
                    return redirect(url_for('users.client'))
                if data == "expert":
                    return redirect(url_for('users.expert'))
                if data == "facturation":
                    return redirect(url_for('users.facturation'))
                if data == "chiffrage":
                    return redirect(url_for('users.chiffrage'))
                if data == "tarifs":
                    return redirect(url_for('users.tarifs'))
                if data == "expert":
                    return redirect(url_for('users.expert'))
                if data == "agenda":
                    return redirect(url_for('users.agenda'))
        
        if current_user.is_authenticated and  expert_concess :
            if form.validate_on_submit:
                data=form.table.data
                if data == "chiffrage":
                    return redirect(url_for('users.chiffrage'))
                if data == "agenda":
                    return redirect(url_for('users.agenda'))

        if current_user.is_authenticated and  expert_audit :
            if form.validate_on_submit:
                data=form.table.data
                if data == "agenda":
                    return redirect(url_for('users.agenda'))

        else:
            #flash(f"Vous n'est pas autorise a acceder cette table",'danger')
            return render_template('manage/dashboard.html',title='Portail', form=form, clients=clients, missions=missions, facturations=facturations, highlight='dashboard')
    return redirect(url_for('users.login'))

@users.route('/client/<int:id>/négociateurs')
@login_required
def negotiateur(id):
    if current_user.TYPE == "Admin":
        client_=list(Client_negotiateur.query.filter(and_(Client_negotiateur.client_id == id ,Client_negotiateur.visibility == True)).order_by(asc(Client_negotiateur.id)).all())
        cli=Client.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/negotiateur.html',Client=client_,ID=id,legend="negotiateur", highlight="client",cli=cli)
    
    return redirect(url_for('users.main'))



@users.route('/delete/<int:id>/negotiateur', methods=['GET'])
@login_required
def delete_negotiateur(id):
    if current_user.TYPE == "Admin":
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        client_history=list(Negotiateur_History.query.filter_by(negotiateur_id=id).all())
        client.visibility=False
        db.session.commit()
        for i in client_history:
            i.visibility=False
            db.session.commit()
        flash(f'Les donnes du negotiateur ont été  suprimmer','success')
        return redirect(url_for('users.negotiateur', id=id))


@users.route('/ajouter/<int:id>/negotiateur',methods=['GET','POST'])
@login_required
def ajouter_negotiateur(id):
    if current_user.TYPE == "Admin":
        form=Negotiateur_Form()
        client=Client.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            user=Client_negotiateur(client.id,form.Sexe.data,form.NOM.data,form.email.data,form.Numero.data)
            db.session.add(user)
            db.session.commit()
            user_history=Client_negotiateur.query.filter(or_(Client_negotiateur.email == form.email.data,Client_negotiateur.nom == form.NOM.data)).first()
            user_his=Negotiateur_History(negotiateur_id=user_history.id,adresse=form.Adresse.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(user_his)
            db.session.commit()
            flash(f'Negotiateur créé avec succès','success')
            return redirect(url_for('users.negotiateur', id=id)) #id check
        print("didn't validate on submit")    
        return render_template('manage/pages/ajouter_negociateur.html',ID=id,form=form,legend="negociateur", highlight='client')
    else:
        return redirect(url_for('users.main'))



@users.route('/show/<int:id>/negotiateur', methods=['GET'])
@login_required
def show_negotiateur(id):
    if current_user.TYPE == "Admin":
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        client_history=Negotiateur_History.query.filter_by(negotiateur_id=id).order_by(asc(Negotiateur_History.date)).first_or_404()
        return render_template('manage/pages/show_nego.html', client=client,history=client_history,legend="negotiateur")


@users.route('/edit/<int:id>/negotiateur', methods=['GET'])
@login_required
def edit_negotiateur(id):
    if current_user.TYPE == "Admin":
        form = Negotiateur_Form()
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        client_history=Negotiateur_History.query.filter_by(negotiateur_id=id).order_by(asc(Negotiateur_History.date)).first_or_404()
        return render_template('manage/pages/edit_negotiateur.html', client=client,history=client_history,form=form,legend="edit_negotiateur")

@users.route('/update/<int:id>/negotiateur', methods=['POST', 'PUT'])#fix pages for action on form
@login_required
def update_negotiateur(id):
    if current_user.TYPE == "Admin":
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        if request.form['Ville'] or  request.form['Pays'] or request.form['CP'] or  request.form['Adresse'] :
            client_check=Negotiateur_History(negotiateur_id=id)
            db.session.add(client_check)
            db.session.commit()
            client_history=Negotiateur_History.query.filter_by(negotiateur_id=id).order_by(asc(Negotiateur_History.date)).first_or_404()
            client_history.ville = request.form['Ville']
            client_history.pays = request.form['Pays']
            client_history.cp = request.form['CP']
            client_history.adresse = request.form['Adresse']
            db.session.commit()

        client.email = request.form['email']
        client.numero = request.form['Numero']
        client.sexe = request.form['Sexe']
        client.nom = request.form['NOM']

        db.session.commit()
        flash(f'Les donnes du negotiateur a été modifiées','success')
        return redirect(url_for('users.negotiateur', id=client.client_id))

    return redirect(url_for('users.edit_negotiateur', id=id))







@users.route('/prospect')
@login_required
def prospect_():
    if current_user.TYPE == "Admin":
        page = request.args.get('page', 1, type=int)
        client_=prospect.query.filter_by(visibility=True).order_by(asc(prospect.id)).paginate(page=page, per_page=10)
        return render_template('manage/pages/prospect.html',Client=client_,legend="client", highlight='prospect')

    
    return redirect(url_for('users.main'))

@users.route('/ajouter/prospect',methods=['GET','POST'])
@login_required
def ajouter_prospect():
    if current_user.TYPE == "Admin":
        form=Client_Form()
        if form.validate_on_submit():
            user=prospect(form.Type.data,form.Societe.data,form.Sexe.data,form.NOM.data,form.email.data,form.Numero.data)
            db.session.add(user)
            db.session.commit()
            user_history=prospect.query.filter(or_(prospect.email==form.email.data,prospect.nom==form.NOM.data)).first()
            user_history.siret==form.Siret.data
            db.session.commit()
            print(user_history.id)
            user_his=prospect_History(prospect=user_history.id,adresse=form.Adresse.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(user_his)
            db.session.commit()
            flash(f'Prospect créé avec succès','success')
            return redirect(url_for('users.prospect_'))
        print("didn't validate on submit")    
        return render_template('manage/pages/ajouter_client.html',form=form,legend="prospect", highlight='prospect')
    else:
        return redirect(url_for('users.main'))



@users.route('/delete/<int:id>/prospect', methods=['GET'])
@login_required
def delete_prospect(id):
    if current_user.TYPE == "Admin":
        client = prospect.query.filter_by(id=id).first_or_404()
        client_history=list(prospect_History.query.filter_by(prospect=id).all())
        client.visibility=False
        db.session.commit()
        for i in client_history:
            i.visibility=False
            db.session.commit()
        flash(f'Les donnes du client ont été  suprimmer','success')
        return redirect(url_for('users.prospect_'))



@users.route('/show/<int:id>/prospect', methods=['GET'])
@login_required
def show_prospect(id):
    if current_user.TYPE == "Admin":
        client = prospect.query.filter_by(id=id).first_or_404()
        client_history=prospect_History.query.filter_by(prospect=id).order_by(asc(prospect_History.date)).first_or_404()
        return render_template('manage/pages/show_client.html', highlight='prospect', client=client,history=client_history,legend='prospect')


@users.route('/edit/<int:id>/prospect', methods=['GET'])
@login_required
def edit_prospect(id):
    if current_user.TYPE == "Admin":
        form = Client_Form()
        client = prospect.query.filter_by(id=id).first_or_404()
        client_history=prospect_History.query.filter_by(prospect=id).order_by(asc(prospect_History.date)).first_or_404()
        return render_template('manage/pages/edit_prospect.html',highlight='prospect', client=client,history=client_history,form=form)

@users.route('/update/<int:id>/prospect', methods=['POST', 'PUT'])#fix pages for action on form
@login_required
def update_prospect(id):
    if current_user.TYPE == "Admin":
        client = prospect.query.filter_by(id=id).first_or_404()
        if request.form['Ville'] or  request.form['Pays'] or request.form['CP'] or  request.form['Adresse'] :
            client_check=prospect_History(prospect=id)
            db.session.add(client_check)
            db.session.commit()
            client_history=prospect_History.query.filter_by(prospect=id).order_by(asc(prospect_History.date)).first_or_404()
            client_history.ville = request.form['Ville']
            client_history.pays = request.form['Pays']
            client_history.cp = request.form['CP']
            client_history.adresse = request.form['Adresse']
            db.session.commit()
        client.email = request.form['email']
        #client.siret = request.form['Siret']
        client.societe = request.form['Societe']
        client.numero = request.form['Numero']
        client.sexe = request.form['Sexe']
        client.TYPE = request.form['Type']
        client.nom = request.form['NOM']
        

        db.session.commit()
        flash(f'Les donnes du negotiateur a été modifiées','success')
        return redirect(url_for('users.prospect_'))
    return redirect(url_for('users.edit_prospect', id=id))





@users.route('/suivi/<int:id>/prospect')
@login_required
def suivi_prospect_(id):
    if current_user.TYPE == "Admin":
        suivi_=list(suivi_prospect.query.filter(and_(suivi_prospect.prospect_id==id,suivi_prospect.visibility==True)).all()) 
        pros=prospect.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/suivi_c.html',Suivi=suivi_,ID=id,legend="prospect",cli=pros)

    return redirect(url_for('users.main'))

@users.route('/ajouter/<int:id>/suivi_propect',methods=['GET','POST'])
@login_required
def ajouter_suivip(id):
    if current_user.TYPE == "Admin":
        form=Suivi_Client() 
        client = prospect.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            suivi=suivi_prospect(client.id,current_user.id,form.commentaire.data)
            db.session.add(suivi)
            db.session.commit()
            flash(f'suivi prospect créé avec succès','success')
            return redirect(url_for('users.suivi_prospect_', id=id))
        return render_template('manage/pages/ajouter_suivi.html',form=form,ID=id,legend="prospect",highlight='prospect')
    #return function 

@users.route('/delete/<int:id>/suivi_propect', methods=['GET'])
@login_required
def delete_suivip(id):
    if current_user.TYPE == "Admin":
        suivi = suivi_prospect.query.filter_by(id=id).first_or_404()
        suivi.visibility=False
        db.session.commit()
        flash(f'Le suivi client a été  suprimmer','success')
        return redirect(url_for('users.suivi_prospect_', id=id))
    return redirect(url_for('users.suivi_prospect_', id=id))

@users.route('/edit/<int:id>/suivi_propect', methods=['GET'])
@login_required
def edit_suivip(id):
    if current_user.TYPE == "Admin":
        form = Suivi_Client()
        suivi = suivi_prospect.query.filter_by(id=id).first_or_404()
        if current_user.id == suivi.responsable:
            return render_template('manage/pages/edit_suivi_p.html', suivi=suivi,form=form)
        else:
            flash(f'Vous ne pouvez pas modifier ce suivi','warning')
            return redirect(url_for('users.suivi_prospect_', id=id))
    return redirect(url_for('users.client'))

@users.route('/update/<int:id>/suivi_propect', methods=['POST', 'PUT'])
@login_required
def update_suivip(id):
    if current_user.TYPE == 'Admin':
        suivi = suivi_prospect.query.filter_by(id=id).first_or_404()
        suivi.commentaire = request.form['commentaire']
        db.session.commit()
        flash(f'Le suivi a été modifiées','success')
        return redirect(url_for('users.suivi_prospect_',id=suivi.prospect_id))
    return redirect(url_for('users.client'))




@users.route("/televeser", methods=['GET','POST'])
#@login_required
def up():
    
    #db.create_all()
    #expert=Expert('M','Admin','Admin','test0001@gmail.com','1234567')
    #db.session.add(expert)
    #db.session.commit()
    #ex=Expert.query.filter_by(nom="Admin").first()
    #his=Expert_History(expert_id=ex.id)
    #db.session.add(his)
    #db.session.commit()
    #expert1=Expert.query.filter_by(nom="Admin").first()
    #hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    #expert1.password = hashed_password
    #db.session.commit()
    #expert=Expert('esxitepas','esxitepas','esxitepas','esxitepas','esxitepas')
    ##client=Client('esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas')
    #db.session.add(client)
    #db.session.commit()
    return render_template('manage/pages/upload.html')




@users.route("/uploader", methods=['GET','POST'])
@login_required
def uploader_():
    if current_user.TYPE == 'Admin':
      # get the uploaded file
      if request.method == 'POST':
        uploaded_file = request.files['file']
        if uploaded_file.filename != '':
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], uploaded_file.filename)
            loc=str(file_path)
            # set the file path
            uploaded_file.save(file_path)
            # save the file
            #expert__(loc)
            #expert__('CONCESS',loc)
           #''' expert__('Manager_chiffrage',loc)
           # expert__('Agent_chiffrage',loc)
           # expert__('Respon Cell Dev',loc)
           # expert__('agent Cell Dev',loc)
           ## expert__('Agent CellTech',loc)
           # expert__('Respon Cell Tech',loc)
           ## expert__('Suiveur Cell Tech',loc)
           # expert__('Respon Cell Planif',loc)
           # expert__('Suiveur Cell Planif',loc)
           # expert__('Agent saisie Cell Planif',loc)'''
            #insert_client('professionnel',loc)
           # insert_client('Locataire',loc)
           # insert_client('Prop',loc)
            #Missions(loc) #learn how to check a whole row for this tables
            #fix_mission()
            #fix_mission()
            #fix_mission()
            #Base(loc)
            #reset()
            #tarif_client(loc)

            
            
            flash(f"Vous avez importer les donnees avec success",'success')
            return redirect(url_for('users.up'))
      return redirect(url_for('users.main'))
    return redirect(url_for('users.login'))


@users.route('/profil')
@login_required
def profil():
    return render_template('manage/pages/profile.html')



#@users.app_errorhandler(404)
#def error_404(error):
 #   return render_template('errors/404.html'),404

@users.app_errorhandler(403)
def error_403(error):
    return render_template('errors/403.html'),403
 
@users.app_errorhandler(500)
def error_500(error):
    return render_template('errors/500.html'),500





@users.route('/search', methods=['GET'])
@login_required
def search ():
    if current_user.TYPE == 'Admin':
        table = request.args.get('table')
        search = "%{}%".format(request.args.get('keyword'))
        key=request.args.get('keyword')
        if table == 'client':
            clients = Client.query.filter(and_(or_(Client.nom.like(search),Client.email.like(search),Client.numero.like(search),Client.societe.like(search),Client.visibility==True))).all()
            if len(clients) > 1:
                title = "Clients"
            else:
                title = "Client"
            return render_template('manage/pages/search_results.html', clients=clients, title=title, table=table, search=request.args.get('keyword'))
        elif table == 'tarif':
            tarifs = Tarifs.query.filter(and_(or_(Tarifs.reference_client.like(search),Tarifs.type_maison.like(search),Tarifs.Prix.like(search),Tarifs.remise.like(search)),Tarifs.visibility==False)).all()#fix reference du client eeh
            if len(tarifs) > 1:
                title = "Tarifs"
            else:
                title = "Tarif"
            return render_template('manage/pages/search_results.html', tarifs=tarifs, title=title, table=table, search=request.args.get('keyword'))
        elif table == 'expert':
            experts = Expert.query.filter(and_(or_(Expert.nom.like(search),Expert.email.like(search),Expert.TYPE.like(search),Expert.numero.like(search)),Expert.visibility==True)).all()
            if len(experts) > 1:
                title = "Experts"
            else:
                title = "Expert"
            return render_template('manage/pages/search_results.html', experts=experts, title=title, table=table, search=request.args.get('keyword'))
        elif table == 'mission':
            try :
                if isinstance(int(key),int) == True:
                    missions= Mission.query.filter(and_(or_(Mission.DATE_REALISE_EDL.like(search),Mission.NRO_FACTURE.like(search),Mission.DATE_FACTURE.like(search),Mission.DATE_FACT_REGLEE.like(search),Mission.Reference_BAILLEUR==int(key),Mission.ID_CONCESS==int(key)),Mission.Visibility==True)).all()
            except:    
                missions = Mission.query.filter(and_(or_(Mission.DATE_REALISE_EDL.like(search),Mission.DATE_FACTURE.like(search),Mission.DATE_FACT_REGLEE.like(search)),Mission.Visibility==True)).all()
            if len(missions) > 1:
                title = "Missions"
            else:
                title = "Mission"
            return render_template('manage/pages/search_results.html', missions=missions, title=title, table=table, search=request.args.get('keyword')) 
        elif table == 'facturation':
            try :
                if isinstance(int(key),int) == True:
                   facturation_ = Facturation.query.filter(and_(or_(Facturation.Facture_no==int(key),Facturation.Pays.like(search),Facturation.Destinataire==int(key),Facturation.expéditeur==int(key),Facturation.Type.like(search)),Facturation.Visibility == True)).all()
            except:    
                facturation_ = Facturation.query.filter(and_(or_(Facturation.Pays.like(search),Facturation.Type.like(search)),Facturation.Visibility == True)).all()
            if len(facturation_) > 1:
                title = "Facturations"  #this search needs to be checked when fixing the db
            else:
                title = "Facturation"
            return render_template('manage/pages/search_results.html', Facturation__=facturation_, title=title, table=table, search=request.args.get('keyword')) 





#/choose



@users.route('/choose/<string:Type>/mission',methods=['GET','POST'])
@login_required
def choosev(Type):
    if current_user.TYPE == "Admin":
        form=time()
        form2=Facturation_Form()
        if form.validate_on_submit():  
            start=datetime.combine(form.Demarrer.data,datetime.min.time())
            end=datetime.combine(start+timedelta(days=30),datetime.min.time())
            client=list()
            relation={}
            price={}
            if Type == "month":
                         mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=start,Mission.DATE_REALISE_EDL<=end,Mission.NRO_FACTURE==None)).order_by(asc(Mission.id)).all())#check query
            if mission_ == client:
                flash(f'cette date a deja ete facture','success')
                return redirect(url_for('users.choosev',Type='month'))
            if mission_:
                for i in mission_:
                    if i.Reference_BAILLEUR not in client:
                        client.append(i.Reference_BAILLEUR)
                    
                for i in client:
                     relation[i] =[]
                
                for i in mission_:
                    if i.Reference_BAILLEUR in relation:
                        relation[i.Reference_BAILLEUR].append(i)
                for i in  relation:
                    price[i] =[]
                    for mission in relation[i]:
                        if mission.CODE_FACTURATION is None:

                            flash(f'SVP Generez une code  Facturation pour cette mission','success')
                            return redirect(url_for('users.show_mission',id=mission.id))

                        else:
                            
                            if mission.CODE_FACTURATION[0:2] == 'TS':
                                price[i].append(mission.CODE_FACTURATION[3:-1])
                            if mission.CODE_FACTURATION[0:2] == 'TN':
                            
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '1' :
                                    
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                        meuble=float(tarif.edl_appt_prix_f1)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f1) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                        
                                    else:
                                        
                                        mission.PRIX_HT_EDL = tarif.edl_appt_prix_f1
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_appt_prix_f1))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '2':
                                    #print('APPT 2')
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f2)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f2) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_appt_prix_f2
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_appt_prix_f2))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '3':
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f3)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f3) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_appt_prix_f3
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_appt_prix_f3))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '4':
                                    
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f4)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f4) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_appt_prix_f4
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_appt_prix_f4))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '5':
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f5)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f5) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_appt_prix_f5
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_appt_prix_f5))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '6':
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f6)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f6) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_appt_prix_f6
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_appt_prix_f6))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '7':
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.EDL_APPT_prix_F7)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f7) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_appt_prix_f7
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_appt_prix_f7))

                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '1' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t1)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t1) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t1
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_pav_villa_prix_t1))
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '2' :
                                    
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t2)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t2) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t2
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_pav_villa_prix_t2))
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '3' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t3)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t3) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t3
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_pav_villa_prix_t3))
                            
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '4' :
                                    
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t4)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t4) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t4
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_pav_villa_prix_t4))
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '5' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t5)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t5) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t5
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_pav_villa_prix_t5))
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '6' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t6)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t6) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t6
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_pav_villa_prix_t6))#goes up to 8  '''
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '7' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t7)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t7) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t7
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_pav_villa_prix_t6))#goes up to 8  '''
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '8' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t8)/2
                                        mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t8) + float(meuble)
                                        db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    else:
                                        mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t8
                                        db.session.commit()
                                        price[i].append(float(tarif.edl_pav_villa_prix_t8))#goes up to 8  '''
                                
                for i in price:
                    a=sum(price[i])
                    price[i]=a
                

                
                
                
            return render_template('manage/pages/ajouter_facturationm.html',form=form2,sum=price,start=start,end=end )

        if Type == "month":
                    return render_template('manage/pages/choose.html',form=form,legend="time")
                    #return render_template('manage/pages/ajouter_facturationm.html', mission=mission_,form=form2,start=start,end=end)

    return redirect(url_for('users.main'))






@users.route('/create_facturem/',methods=['GET','POST'])
@login_required
def create_facturem():
    if current_user.TYPE == "Admin":
        form=Facturation_Form()
        client=list()
        relation={}
        relation2={}
        price=list()
        _mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.NRO_FACTURE==None,Mission.Visibility==True,Mission.coherent==False)).order_by(desc(Mission.id)).all())
        mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.NRO_FACTURE==None,Mission.Visibility==True,Mission.coherent==True)).order_by(desc(Mission.id)).all())#check query
        
        if mission_:
            for i in mission_:
                    if i.Reference_BAILLEUR not in client:
                        client.append(i.Reference_BAILLEUR)
                    
            for i in client:
                    relation[i] =[]

            for i in client:
                relation2[i] =[]

            for i in _mission_:
                if i.Reference_BAILLEUR in relation2:
                    relation2[i.Reference_BAILLEUR].append(i)

            for i in mission_:
                if i.Reference_BAILLEUR in relation:
                    relation[i.Reference_BAILLEUR].append(i)
            for i in  relation:
                facture=facturation_client(Statut=request.form['Statut'],Date_mission=request.form['Demarrer'],client=i)
                db.session.add(facture)
                db.session.commit()
                factura=str(facture.Date_de_creation)
                facture.n_facture=str(facture.id)+'-'+str(factura[2:4])+str(factura[5:7])+'-C'
                db.session.commit()
                for mission in relation[i]:
                    price.append(float(mission.PRIX_HT_EDL))
                    mission.NRO_FACTURE = facture.n_facture
                    mission.DATE_FACTURE = facture.Date_de_creation
                    fact_m=facturation_mission(ref_mission=mission.id,fact_mission=facture.id)
                    db.session.add(fact_m)
                    db.session.commit()
                    if _mission_ :
                        for i in relation2:
                            for mission in relation2[i]:
                                check=Facturation_history.query.filter_by(mission=mission.id).first()
                                if check is None:
                                    failed=Facturation_history(date=request.form['Demarrer'],mission=mission.id,facture=facture.id)
                                    db.session.add(failed)
                                    db.session.commit()
                facture.Montant_HT=sum(price)
                db.session.commit()
                price=list()

            return  redirect(url_for('users.facturationa'))   
        else:
            flash(f'Erreur de Codification ','warning')
            return redirect(url_for('users.facturationa'))
    return redirect(url_for('users.main'))        
        
            
               

@users.route('/choose/mission',methods=['GET','POST'])
@login_required
def choosep():
    if current_user.TYPE == "Admin":#to be completed
        if request.method == 'POST':
                    a=request.form.getlist('my_checkbox')
        
        form=Facturation_Form()
        price=list()
        m=list()
        v=2
        for i in a:
            mission=Mission.query.filter(and_(Mission.id==int(i),Mission.NRO_FACTURE==None,Mission.Visibility==True)).first()
            if mission:
                v=mission.Reference_BAILLEUR
                m.append(mission.id)
                if mission.CODE_FACTURATION is None:

                    flash(f'SVP Generez une code  Facturation pour cette mission','success')
                    return redirect(url_for('users.show_mission',id=mission.id))

                else:
                    
                    if mission.CODE_FACTURATION[0:2] == 'TS':
                        price.append(mission.CODE_FACTURATION[3:-1])
                    if mission.CODE_FACTURATION[0:2] == 'TN':
                    
                        if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '1'   :
                            
                            tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                            if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                meuble=float(tarif.edl_appt_prix_f1)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f1) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                                
                            else:
                                
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f1
                                db.session.commit()
                                price.append(float(tarif.edl_appt_prix_f1))
                        if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '2':
                            #print('APPT 2')
                            tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                meuble=float(tarif.edl_appt_prix_f2)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f2) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f2
                                db.session.commit()
                                price.append(float(tarif.edl_appt_prix_f2))
                        if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '3':
                            tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                meuble=float(tarif.edl_appt_prix_f3)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f3) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f3
                                db.session.commit()
                                price.append(float(tarif.edl_appt_prix_f3))
                        if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '4':
                            
                            tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                meuble=float(tarif.edl_appt_prix_f4)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f4) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f4
                                db.session.commit()
                                price.append(float(tarif.edl_appt_prix_f4))
                        if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '5':
                            tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                meuble=float(tarif.edl_appt_prix_f5)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f5) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f5
                                db.session.commit()
                                price.append(float(tarif.edl_appt_prix_f5))
                        if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '6':
                            tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                meuble=float(tarif.edl_appt_prix_f6)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f6) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f6
                                db.session.commit()
                                price.append(float(tarif.edl_appt_prix_f6))
                        if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '7':
                            tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                meuble=float(tarif.EDL_APPT_prix_F7)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f7) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f7
                                db.session.commit()
                                price.append(float(tarif.edl_appt_prix_f7))

                        if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '1' :
                            tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':
                                meuble=float(tarif.edl_pav_villa_prix_t1)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t1) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t1
                                db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t1))
                        if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '2' :
                            
                            tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':
                                meuble=float(tarif.edl_pav_villa_prix_t2)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t2) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t2
                                db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t2))
                        if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '3' :
                            tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':
                                meuble=float(tarif.edl_pav_villa_prix_t3)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t3) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t3
                                db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t3))
                    
                        if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '4' :
                            
                            tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':
                                meuble=float(tarif.edl_pav_villa_prix_t4)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t4) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t4
                                db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t4))
                        if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '5' :
                            tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':
                                meuble=float(tarif.edl_pav_villa_prix_t5)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t5) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t5
                                db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t5))
                        if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '6' :
                            tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':
                                meuble=float(tarif.edl_pav_villa_prix_t6)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t6) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t6
                                db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t6))#goes up to 8  '''
                        if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '7' :
                            tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':
                                meuble=float(tarif.edl_pav_villa_prix_t7)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t7) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t7
                                db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t6))#goes up to 8  '''
                        if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '8' :
                            tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                            if mission.CODE_FACTURATION[2:5] == '150':
                                meuble=float(tarif.edl_pav_villa_prix_t8)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t8) + float(meuble)
                                db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            else:
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t8
                                db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t8))#goes up to 8  '''

        p=sum(price)
        form.Missions.data=m
        return render_template('manage/pages/ajouter_facturtionp.html', mission=m,form=form,sum=p,name=v)


    return redirect(url_for('users.main'))




@users.route('/create_facturep/',methods=['GET','POST'])
@login_required
def create_facturep():
    if current_user.TYPE == "Admin":
        form=Facturation_Form()
        client=list()
        a=form.Missions.data[1:-1]
        mi=a.split(",")
        missions=list()
        if mi is not None:
            for i in mi:
                mission=Mission.query.filter(and_(Mission.id==int(i),Mission.NRO_FACTURE==None,Mission.Visibility==True)).first()
                missions.append(mission)

            facture=facturation_client(Montant_HT=request.form['Montant_HT'],Statut=request.form['Statut'],client=request.form['Reference_client'])
            db.session.add(facture)
            db.session.commit()
            factura=str(facture.Date_de_creation)
            facture.n_facture=str(facture.id)+'-'+str(factura[2:4])+str(factura[5:7])+'-C'
            db.session.commit() 

            for i in missions:
                i.NRO_FACTURE = facture.n_facture
                i.DATE_FACTURE = facture.Date_de_creation
                fact_m=facturation_mission(ref_mission=i.id,fact_mission=facture.id)
                db.session.add(fact_m)
                db.session.commit()

            return redirect(url_for('users.facturation',id=request.form['Reference_client']))
        else:
            flash(f'Erreur de Codification ','warning')
            return redirect(url_for('users.facturation',id=request.form['Reference_client']))
    return redirect(url_for('users.main'))
        



@users.route('/menu/factures/',methods=['GET','POST'])
@login_required
def menufactures():
    if current_user.TYPE == "Admin":
                
            return render_template('manage/pages/option_facture.html')
    return redirect(url_for('users.main'))


@users.route('/menu/search/',methods=['GET'])
@login_required
def menusearch():
    if current_user.TYPE == "Admin":
        search = "%{}%".format(request.args.get('keyword'))
        key=request.args.get('keyword')
        
        if isinstance(int(key),int) == True:
            client = Client.query.filter_by(reference=int(key)).first()
            if client:
                return redirect(url_for('users.client_mission',id=client.id))
            else:
                flash(f"Ce client n'existe pas",'warning')
                return redirect(url_for('users.menufactures'))
        else:
            flash(f'La reference es incorrect','warning')
            return redirect(url_for('users.menufactures'))
    return redirect(url_for('users.main'))