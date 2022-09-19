from flask import Flask,render_template,url_for,flash,redirect,request,Blueprint,make_response,send_from_directory
from Database_project.project.data_base_.Models import db,Tarifs,Mission,Client,Expert,Expert_History,Client_History,Client_negotiateur,Negotiateur_History,suivi_client,prospect,prospect_History,prospect,suivi_client,suivi_prospect,facturation_client,facturation_mission,Tarif_base,Facturation_history,expert_facturation,compte_mensuel,Type_expert
from Database_project.project.data_base_.forms import (RegistrationForm,UpdateAccountForm,Mission_editForm, LoginForm ,tableform,Negotiateur_Form1,Client_Form,Facturation_Form, Tarif_Form,RequestResetForm,ResetPasswordForm,Suivi_Client,Expert_editForm,Mission_add,Invitation_Agenda,time,Tarif_Base,Agenda_form,Negotiateur_Form,Tarif_edit,Client_edit,RegistrationForm1,Facturationex_Form,rectify_Form,mission_export,mission_id,Facturationind_Form)
from Database_project.project.data_base_ import bcrypt
from Database_project.project.data_base_.data  import Missions,expert__,insert_client,fix_mission,Base,reset,Missions2,Missions1
from Database_project.project.data_base_.client_data  import lient,lienta
from Database_project.project.data_base_.expert_data  import xpert,xperte
from Database_project.project.data_base_.tarif_data  import arif
from Database_project.project.data_base_.Suivi  import suiv
from Database_project.project.data_base_.utils import send_reset_email,generate,gen_name,send_pdf
from sqlalchemy import or_, and_, desc,asc
from flask_login import login_user,current_user,logout_user,login_required,LoginManager
import os
#import pdfkit
from Database_project.project.data_base_ import create_app
from os.path import join, dirname, realpath
from datetime import date,timedelta,datetime,timezone 
from Database_project.project.data_base_.export import Export
import sqlalchemy as sa
from sqlalchemy import extract
import json
import base64
#from wkhtmltopdf import wkhtmltopdf
#from flask_wkhtmltopdf import render_template_to_pdf
#from flask_wkhtmltopdf import Wkhtmltopdf
from flask import session
import locale

locale.setlocale(locale.LC_TIME,'fr_FR.UTF-8')

users =Blueprint('users',__name__)
app= create_app()
exo=Export()

#wkhtmltopdf = Wkhtmltopdf(app)

PER_PAGE = 10

@users.route('/clean', methods=['GET', 'POST'])
def clean():
    cli=prospect.query.filter_by(visibility=True).all()
    for i in cli:
        '''i.appli=False
        db.session.commit()'''
        '''i.anom=False
        i.reason=''
        db.session.commit()'''
        if len(str(i.siret)) > 5 or  i.societe != '':
            i.TYPE ='Professionel'
            db.session.commit()
        if len(str(i.siret)) < 5 and i.societe != '':
            i.TYPE ='Particulier'
            db.session.commit()
        '''if len(str(i.numero)) >= 10 :
            if i.numero[0]!='0':
                i.anom=True
                i.reason='Anomalie sur le numero de telephone'
                db.session.commit()
        if len(str(i.numero)) <= 8:
            if i.numero[0]!='0':
                i.anom=True
                i.reason='Anomalie sur le numero de telephone'
                db.session.commit()'''
        #'''if len(str(i.numero)) == 9:
        #    v=str(i.numero)
        #    i.numero='0'+v
        #    db.session.commit()'''
    cli=Client.query.filter_by(visibility=True).all()
    for i in cli:
        if len(str(i.siret)) > 5 or  i.societe != '':
            i.TYPE ='Professionel'
            db.session.commit()
        if len(str(i.siret)) < 5 and i.societe != '':
            i.TYPE ='Particulier'
            db.session.commit()
        '''i.anom=False
        i.reason=''
        db.session.commit()
        if len(str(i.numero)) < 9 :
            if i.numero[0]!='0':
                i.anom=True
                i.reason='Anomalie sur le numero de telephone'
                db.session.commit()
        if len(str(i.numero)) == 9:
            v=str(i.numero)
            i.numero='0'+v
            db.session.commit()
        if len(str(i.numero)) >= 10 :
            if i.numero[0]!='0':
                i.anom=True
                i.reason='Anomalie sur le numero de telephone'
                db.session.commit()'''
        #if len(str(i.siret)) > 5 and i.societe == '':
        #    i.TYPE ='Professionel'
        #    db.session.commit()
        #if len(str(i.siret)) < 5 and i.societe != '':
        #    i.TYPE ='Particulier'
        #    db.session.commit()
       
         
    return redirect(url_for('users.main'))

@users.route('/client', methods=['GET', 'POST'])
@login_required
def client():
    global PER_PAGE
    global Ord
    Ord="a" 
    db.create_all()
    a='12345'
    #hashed_password = bcrypt.generate_password_hash(a).decode('utf-8')
    
    if current_user.TYPE == "Admin":
        Type = request.args.get('ron')
        if Type != None:
            if Type == "r":
                his=[]
                client_=Client.query.filter(and_(Client.visibility==True)).order_by(asc(Client.id)).all()
                history=Client_History.query.filter(and_(Client_History.visibility==True,Client_History.etat_client=='Actif')).order_by(asc(Client_History.id)).all()
                for i in history:
                    his.append(i.client_id)
                for i in client_:
                    if i.id not in his:
                        client_.remove(i)
            if Type == "nr":
                his=[]
                client_=Client.query.filter(and_(Client.visibility==True)).order_by(asc(Client.id)).all()
                history=Client_History.query.filter(and_(Client_History.visibility==True,Client_History.etat_client=='Parti')).order_by(asc(Client_History.id)).all()
                for i in history:
                    his.append(i.client_id)
                for i in client_:
                    if i.id not in his:
                        client_.remove(i)
        else:
            client_=Client.query.filter_by(visibility=True).order_by(asc(Client.id)).all()
            history=Client_History.query.filter_by(visibility=True).order_by(asc(Client_History.id)).all()
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
        actc = Client_History.query.filter_by(etat_client='Actif').count()
        ano = Client.query.filter_by(anom=True).count()
        patc = Client_History.query.filter_by(etat_client='Parti').count()
        prospro = Client.query.filter_by(TYPE ='Professionel').count()
        prospart = Client.query.filter_by(TYPE ='Particulier').count()
        return render_template('manage/pages/client.html',prospro=prospro,prospart=prospart,ano=ano,actc=actc,patc=patc,cli_ent=zip(client_,history),legend="client", highlight='client')
    return redirect(url_for('users.main'))
 
@users.route('/ajouter/client',methods=['GET','POST'])
@login_required
def ajouter_client():
    if current_user.TYPE == "Admin":
        form=Client_Form()
        
        if form.validate_on_submit():
            user=Client(TYPE=form.Type.data,societe=form.Societe.data,titre=form.Sexe.data,nom=form.nom.data,prenom=form.prenom.data,email=form.email.data,numero=form.Numero.data,siret=form.Siret.data)
            db.session.add(user)
            db.session.commit()
            tous=[]
            alll=list(Client.query.all())
            for i in alll:
                tous.append(i.reference)
            user.reference =generate(tous)
            db.session.commit()
            client_history=Client_History(client_id=user.id,adresse1=form.Adresse1.data,adresse2=form.Adresse2.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(client_history)
            db.session.commit()
            client_history.etat_client = form.EtatClient.data
            client_history.mpd_extranet =form.MdpExtranet.data
            client_history.login_extranet=form.LoginExtranet.data
            db.session.commit()
            flash(f'Le client a été créé avec succès','success')
            return redirect(url_for('users.show_client',id=user.id))
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
            email = Expert.query.filter(and_(Expert.trigramme==form.expert.data,Expert.trigramme!='')).first()#.lower()
            suivi=suivi_client(client.id,email.id,form.commentaire.data)
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
        flash(f'Le suivi client a été supprimé','success')
        return redirect(url_for('users.suivi_client_', id=suivi.client))
    return redirect(url_for('users.client'))

@users.route('/edit/<int:id>/suivi_client', methods=['GET','POST'])
@login_required
def edit_suivi(id):
    if current_user.TYPE == "Admin":
        form = Suivi_Client()
        suivi = suivi_client.query.filter_by(id=id).first_or_404()
        ex=Expert.query.filter_by(id=suivi.responsable).first()
        #if current_user.id == suivi.responsable:
        if form.validate_on_submit():
            email = Expert.query.filter(and_(Expert.trigramme==form.expert.data,Expert.trigramme!='')).first()#.lower()
            suivi.commentaire = form.commentaire.data
            suivi.responsable =email.id
            db.session.commit()
            flash(f'Le suivi a été modifié','success')
            return redirect(url_for('users.suivi_client_', id=suivi.client))
        return render_template('manage/pages/edit_suivi.html',ex=ex, suivi=suivi,form=form, highlight="client")
        #else:
           # flash(f'Vous ne pouvez pas modifier ce suivi','warning')
           # return redirect(url_for('users.suivi_client_', id=suivi.client))
    return redirect(url_for('users.client'))



@users.route('/show/<int:id>/client', methods=['GET'])
@login_required
def show_client(id):
    if current_user.TYPE == "Admin":
        client = Client.query.filter_by(id=id).first_or_404()
        client_history=Client_History.query.filter_by(client_id=id).order_by(asc(Client_History.date)).first_or_404()
        try:
            client_Tarif=Tarifs.query.filter_by(reference_client=id).first()
        
            return render_template('manage/pages/show_client.html', client=client,history=client_history,legend="client",tarif=client_Tarif, highlight='client')
        except:
            return render_template('manage/pages/show_client.html', client=client,history=client_history,legend="client",tarif=None, highlight='client')



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
        flash(f'Le client a été supprimé','success')
        return redirect(url_for('users.client'))

@users.route('/edit/<int:id>/client', methods=['GET','POST'])
@login_required
def edit_client(id):
    if current_user.TYPE == "Admin":
        form = Client_edit()
        client = Client.query.filter_by(id=id).first_or_404()
        form.client_id.data=id
        
        if form.validate_on_submit():
            f=form.validate2(form.email.data,form.client_id.data)
            if f==True:
                flash(f"l'email es Deja pris",'Warning')
                return redirect(url_for('users.edit_client', id=client.id))
            
            if client.id==int(form.client_id.data):
            
                client_history=Client_History.query.filter_by(client_id=id).first()
                client_history.ville = form.Ville.data
                client_history.pays = form.Pays.data
                client_history.cp = form.CP.data
                client_history.adresse1 = form.Adresse1.data
                client_history.adresse2 = form.Adresse2.data
                client_history.etat_client = form.EtatClient.data
                client_history.mpd_extranet =form.MdpExtranet.data
                client_history.login_extranet=form.LoginExtranet.data
                db.session.commit()
                client.reference=form.Reference.data
                client.email = form.email.data
                client.siret = form.Siret.data
                client.societe = form.Societe.data
                client.numero = form.Numero.data
                client.titre = form.Sexe.data
                client.TYPE = form.Type.data
                client.enseigne =form.Enseigne.data
                client.prenom= form.prenom.data
                client.nom= form.nom.data
                db.session.commit()
                flash(f'Informations client modifiées','success')
                return redirect(url_for('users.show_client',id=id))
                
                
        client_history=Client_History.query.filter_by(client_id=id).order_by(asc(Client_History.date)).first_or_404()
        return render_template('manage/pages/edit_client.html', highlight='client', client=client,history=client_history,form=form,legend="client")

@users.route('/mission',methods=['GET','POST'])
@login_required
def mission():

    if current_user.TYPE == 'Admin':
        page = request.args.get('page',1,type=int)
        key=request.args.get('keyword')
        date=request.args.get('date')
        date2=request.args.get('date2')
        if date and date2:
            dat=datetime.fromisoformat(date)
            dat2=datetime.fromisoformat(date2)
        Type = request.args.get('ron')
        table =  request.args.get('table')
        table2 =  request.args.get('table2')
        reglee=Mission.query.filter(Mission.DATE_FACT_REGLEE!=None).count()
        notreglee=Mission.query.filter(Mission.DATE_FACT_REGLEE==None).count()
        ano=Mission.query.filter(Mission.coherent==False).count()

        
        if key:
            try:
                try:
                    int(key)
                    Cli=Client.query.filter_by(reference=key).first()
                    if Cli:
                        mission_=Mission.query.filter(and_(Mission.Reference_BAILLEUR==Cli.id,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                        return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
                except:
                    expert=Expert.query.filter(Expert.nom.like(key)).first()
                    if expert:
                        mission_=Mission.query.filter(and_(Mission.ID_AS==expert.id,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                        return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
                    else:
                        try:
                            mission_=Mission.query.filter(and_(Mission.PRIX_HT_EDL==float(key),Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
                        except:
                            mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
            except:
            
                mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
        if date and date2 and Type != None:
                    if Type == "r":
                        mission_=Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=date,Mission.DATE_REALISE_EDL<=date2,Mission.DATE_FACT_REGLEE!=None,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                        return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,date=date,date2=date2,Type=Type,legend="mission", highlight='mission')
                    if Type == "nr":
                        mission_=Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=date,Mission.DATE_REALISE_EDL<=date2,Mission.DATE_FACT_REGLEE==None,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                        return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,date=date,date2=date2,Type=Type,legend="mission", highlight='mission')
        if date and date2:
            mission_=Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=date,Mission.DATE_REALISE_EDL<=date2,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,date=date,date2=date2,Type=None,legend="mission", highlight='mission')
        
        if Type == "r":
            mission_=Mission.query.filter(Mission.DATE_FACT_REGLEE!=None).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,Type=Type,legend="mission", highlight='mission')
        
        if Type == "nr":
            mission_=Mission.query.filter(Mission.DATE_FACT_REGLEE==None).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Type=Type,Mission=mission_,legend="mission", highlight='mission')

        if table and table2:
            if table == "mission":
                if table2 == "asc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(asc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,legend="mission", highlight='mission')
            if table == "edl" :
                if table2 == "asc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(asc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
            if table == "ht" :
                if table2 == "asc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(asc(Mission.PRIX_HT_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.PRIX_HT_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
            if table == "ht" :
                if table2 == "asc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(asc(Mission.PRIX_HT_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.PRIX_HT_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
            if table == "fac" :
                if table2 == "asc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(asc(Mission.DATE_FACTURE)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.DATE_FACTURE)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
        
        else:
            mission_=Mission.query.filter_by(Visibility=True).order_by(desc(Mission.id)).paginate(page=page ,per_page=50)
            return render_template('manage/pages/mission.html',Mission=mission_,legend="mission", highlight='mission',reg=reglee,ano=ano,non=notreglee)
    if current_user != 'Admin':
        page = request.args.get('page',1,type=int)
        key=request.args.get('keyword')
        date=request.args.get('date')
        date2=request.args.get('date2')
        if date and date2:
            dat=datetime.fromisoformat(date)
            dat2=datetime.fromisoformat(date2)
        table =  request.args.get('table')
        table2 =  request.args.get('table2')
        Type = request.args.get('ron')
        reglee=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_FACT_REGLEE!=None)).count()
        notreglee=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_FACT_REGLEE==None)).count()
        ano=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Anomalie==True)).count()

        
        
        
        if key:
            try:
                try:
                    int(key)
                    Cli=Client.query.filter_by(reference=key).first()
                    if Cli:
                        mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Reference_BAILLEUR==Cli.id,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                        return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
                except:
                    expert=Expert.query.filter(Expert.nom.like(key)).first()
                    if expert:
                        mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.ID_AS==expert.id,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                        return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
                    else:
                        try:
                            mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.PRIX_HT_EDL==float(key),Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
                        except:
                            mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
            except:
            
                mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,key=key,Mission=mission_,legend="mission", highlight='mission')
        if date and date2 and Type != None:
            if Type == "r":
                mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_REALISE_EDL>=date,Mission.DATE_REALISE_EDL<=date2,Mission.DATE_FACT_REGLEE!=None,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,date=date,date2=date2,Type=Type,legend="mission", highlight='mission')
            if Type == "nr":
                mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_REALISE_EDL>=date,Mission.DATE_REALISE_EDL<=date2,Mission.DATE_FACT_REGLEE==None,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,date=date,date2=date2,Type=Type,legend="mission", highlight='mission')
        if date and date2:
            mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_REALISE_EDL>=date,Mission.DATE_REALISE_EDL<=date2,Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,date=date,date2=date2,Type=None,legend="mission", highlight='mission')
        
        if Type == "r":
            mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_FACT_REGLEE!=None)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,Type=Type,legend="mission", highlight='mission')
        
        if Type == "nr":
            mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_FACT_REGLEE==None)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
            return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,Type=Type,legend="mission", highlight='mission')

        if table and table2:
            if table == "mission":
                if table2 == "asc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(asc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,Mission=mission_,legend="mission", highlight='mission')
            if table == "edl" :
                if table2 == "asc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(asc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(desc(Mission.DATE_REALISE_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
            if table == "ht" :
                if table2 == "asc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(asc(Mission.PRIX_HT_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(desc(Mission.PRIX_HT_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
            if table == "ht" :
                if table2 == "asc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(asc(Mission.PRIX_HT_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(desc(Mission.PRIX_HT_EDL)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
            if table == "fac" :
                if table2 == "asc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(asc(Mission.DATE_FACTURE)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
                if table2 == "desc" :
                    mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(desc(Mission.DATE_FACTURE)).paginate(page=page ,per_page=50)
                    return render_template('manage/pages/mission.html',reg=reglee,ano=ano,non=notreglee,table=table,table2=table2,Mission=mission_,legend="mission", highlight='mission')
        
        else:
            mission_=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Visibility==True)).order_by(desc(Mission.id)).paginate(page=page ,per_page=50)
            return render_template('manage/pages/mission.html',Mission=mission_,legend="mission", highlight='mission',reg=reglee,ano=ano,non=notreglee)


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
            print('ok1')
            price=list()
            if Type == "client":
                mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=start,Mission.DATE_REALISE_EDL<=end,Mission.Reference_BAILLEUR==id,Mission.NRO_FACTURE=='')).order_by(asc(Mission.id)).all())#check query
            
           # if Type == "single":
              #  mission_=list(Mission.query.filter(and_(Mission.id==id,Mission.DATE_REALISE_EDL>=start,Mission.DATE_REALISE_EDL<=end,Mission.NRO_FACTURE=='')).order_by(asc(Mission.id)).all())
            if mission_ == price:
                flash(f'cette date a deja ete facture','success')
                return redirect(url_for('users.choose',id=id))
            try:
                if mission_:
                    for mission in mission_:
                        print(mission.PRIX_HT_EDL)
                        if mission.TYPE_LOGEMENT == None:
                                mission.TYPE_LOGEMENT = ''
                                db.session.commit()
                        if mission.CODE_FACTURATION == None:
                            mission.CODE_FACTURATION = ''
                            db.session.commit()
                    
                        if mission.CODE_FACTURATION is None:

                            flash(f'SVP Generez une code  Facturation pour cette mission','success')
                            return redirect(url_for('users.show_mission',id=mission.id))

                        else:
                            
                            if mission.CODE_FACTURATION[0:2] == 'TS':
                                price.append(mission.CODE_FACTURATION[3:-1])
                            if mission.CODE_FACTURATION[0:2] == 'TN':
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == 'U' :
                                        
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                                        if tarif != None :
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                                meuble=float(tarif.edl_prix_std)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_prix_std) + float(meuble)
                                                    db.session.commit()
                                                #price.append(float(mission.PRIX_HT_EDL))
                                                
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_prix_std
                                                    db.session.commit()
                                        price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '1'   :
                                    
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                            meuble=float(tarif.edl_appt_prix_f1)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f1) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                            
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f1
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '2':
                                    #print('APPT 2')
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                                            meuble=float(tarif.edl_appt_prix_f2)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f2) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f2
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '3':
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                                            meuble=float(tarif.edl_appt_prix_f3)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f3) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f3
                                                db.session.commit()
                                    price.append(float(tarif.mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '4':
                                    
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                                            meuble=float(tarif.edl_appt_prix_f4)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f4) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f4
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '5':
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                                            meuble=float(tarif.edl_appt_prix_f5)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f5) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f5
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '6':
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                                            meuble=float(tarif.edl_appt_prix_f6)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f6) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f6
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '7':
                                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                                            meuble=float(tarif.EDL_APPT_prix_F7)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f7) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f7
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))

                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '1' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':
                                            meuble=float(tarif.edl_pav_villa_prix_t1)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t1) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t1
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '2' :
                                    
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':
                                            meuble=float(tarif.edl_pav_villa_prix_t2)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t2) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t2
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '3' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':
                                            meuble=float(tarif.edl_pav_villa_prix_t3)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t3) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t3
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                            
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '4' :
                                    
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':
                                            meuble=float(tarif.edl_pav_villa_prix_t4)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t4) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t4
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '5' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':
                                            meuble=float(tarif.edl_pav_villa_prix_t5)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t5) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t5
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '6' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':
                                            if mission.PRIX_HT_EDL==0.00 :
                                                meuble=float(tarif.edl_pav_villa_prix_t6)/2
                                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t6) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t6
                                                db.session.commit()
                                    price.append(float(tarif.mission.PRIX_HT_EDL))#goes up to 8  '''
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '7' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':
                                            meuble=float(tarif.edl_pav_villa_prix_t7)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t7) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t7
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))#goes up to 8  '''
                                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '8' :
                                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                    if tarif != None :
                                        if mission.CODE_FACTURATION[2:5] == '150':
                                            meuble=float(tarif.edl_pav_villa_prix_t8)/2
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t8) + float(meuble)
                                                db.session.commit()
                                            #price.append(float(mission.PRIX_HT_EDL))
                                        else:
                                            if mission.PRIX_HT_EDL==0.00 :
                                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t8
                                                db.session.commit()
                                    price.append(float(mission.PRIX_HT_EDL))#goes up to 8  '''
                                else:
                                        
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = 0
                                            db.session.commit()
                                        else:
                                            price.append(float(mission.PRIX_HT_EDL))
                            else:
                                if mission.PRIX_HT_EDL==0.00:
                                    mission.PRIX_HT_EDL = 0
                                    db.session.commit()
                                else:
                                    price.append(float(mission.PRIX_HT_EDL))
            except:
                flash(f"Veuillez vérifier le tarif du client, assurez-vous qu'il est correct",'warning')
                return redirect(url_for('users.choose',id=id))   
            add_sum=sum(price)
            if Type == "client":
                return render_template('manage/pages/ajouter_facturationc.html', highlight='mission', mission=mission_,form=form2,sum=add_sum,start=start,end=end)
            else:
                flash(f'choisisez une date existante','danger')
                return redirect(url_for('users.choose',id=id))
        return render_template('manage/pages/choose.html',form=form,legend="time", highlight='mission')

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

@users.route('/<int:id>/rectify')
@login_required
def rectify(id):
    if current_user.TYPE == "Admin":
        failed=Facturation_history.query.filter_by(mission=id).first()
        mission=Mission.query.filter_by(id=id).first()
        form=rectify_Form()
        def done(failed,id):
            failed.visibility=False
            fac=facturation_mission(facture=failed.facture,ref_mission=id)
            db.session.add(fac)
            db.session.commit()
        if  form.validate_on_submit():
            mission.CODE_FACTURATION=form.CODE_FACTURATION.data
            mission.TYPE_LOGEMENT=form.TYPE_LOGEMENT.data
            db.session.commit() 
            if mission.CODE_FACTURATION[0:2] == 'TS':
                mission.PRIX_HT_EDL = int(mission.CODE_FACTURATION[3:-1])
                db.session.commit()
                done(failed,id)
                return redirect(url_for('users.show_fac',id=failed.facture))
            if mission.CODE_FACTURATION[0:2] == 'TN':
                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == 'U' :
                        
                        tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                        if tarif !=None:
                            if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                meuble=float(tarif.edl_prix_std)/2
                                if mission.PRIX_HT_EDL==0.00:
                                    mission.PRIX_HT_EDL = float(tarif.edl_prix_std) + float(meuble)
                                    db.session.commit()
                                    #done(failed,id)
                                    #return redirect(url_for('users.show_fac',id=failed.facture))
                                
                            else:
                                if mission.PRIX_HT_EDL==0.00:
                                    mission.PRIX_HT_EDL = tarif.edl_prix_std
                                    db.session.commit()
                        done(failed,id)
                        return redirect(url_for('users.show_fac',id=failed.facture))
                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '1'   :
                    
                    tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                            meuble=float(tarif.edl_appt_prix_f1)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f1) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f1
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '2':
                    #print('APPT 2')
                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                            meuble=float(tarif.edl_appt_prix_f2)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f2) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f2
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '3':
                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                            meuble=float(tarif.edl_appt_prix_f3)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f3) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f3
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '4':
                    
                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                            meuble=float(tarif.edl_appt_prix_f4)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f4) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                            #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f4
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '5':
                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                            meuble=float(tarif.edl_appt_prix_f5)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f5) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f5
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '6':
                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                            meuble=float(tarif.edl_appt_prix_f6)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f6) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f6
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
                if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '7':
                    tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':#check print
                            meuble=float(tarif.EDL_APPT_prix_F7)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f7) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_appt_prix_f7
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        

                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '1' :
                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':
                            meuble=float(tarif.edl_pav_villa_prix_t1)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t1) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t1
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '2' :
                    
                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':
                            meuble=float(tarif.edl_pav_villa_prix_t2)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t2) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t2
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '3' :
                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':
                            meuble=float(tarif.edl_pav_villa_prix_t3)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t3) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t3
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
            
                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '4' :
                    
                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':
                            meuble=float(tarif.edl_pav_villa_prix_t4)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t4) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t4
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '5' :
                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':
                            meuble=float(tarif.edl_pav_villa_prix_t5)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t5) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t5
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '6' :
                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':
                            if mission.PRIX_HT_EDL==0.00 :
                                meuble=float(tarif.edl_pav_villa_prix_t6)/2
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t6) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t6
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '7' :
                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':
                            meuble=float(tarif.edl_pav_villa_prix_t7)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t7) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                            
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t7
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                        
                if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '8' :
                    tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                    if tarif !=None:
                        if mission.CODE_FACTURATION[2:5] == '150':
                            meuble=float(tarif.edl_pav_villa_prix_t8)/2
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t8) + float(meuble)
                                db.session.commit()
                                #done(failed,id)
                                #return redirect(url_for('users.show_fac',id=failed.facture))
                        else:
                            if mission.PRIX_HT_EDL==0.00 :
                                mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t8
                                db.session.commit()
                    done(failed,id)
                    return redirect(url_for('users.show_fac',id=failed.facture))
                else:
                    flash(f'Erreur de Codification ,veuillez corriger','warning')
                    return redirect(url_for('users.rectify',id=id))
        return render_template('manage/pages/rectify.html',form=form,mission=mission, highlight='mission') 
        #after work is done
        #pass mission in facturation then register  it under the 
#shows all the factures of the clients,make a page that will show all the data of this particular table
    return redirect(url_for('users.main'))


@users.route('/create_facturec/',methods=['GET','POST'])
@login_required
def create_facturec():
    if current_user.TYPE == "Admin":
        form=Facturation_Form()
        
        
        _mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.NRO_FACTURE=='',Mission.Visibility==True,Mission.coherent==False,Mission.Reference_BAILLEUR==request.form['Reference_client'])).order_by(desc(Mission.id)).all())
        mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.NRO_FACTURE=='',Mission.Visibility==True,Mission.coherent==True,Mission.Reference_BAILLEUR==request.form['Reference_client'])).order_by(desc(Mission.id)).all())#check query

        
            
        if mission_:
           
            facture=facturation_client(Montant_HT=request.form['Montant_HT'],Statut='attente',Date_mission=request.form['Demarrer'],client=request.form['Reference_client'])
            db.session.add(facture)
            db.session.commit()
            factura=str(facture.Date_de_creation)
            facture.n_facture=str(facture.id)+'-'+str(factura[2:4])+str(factura[5:7])+'-C'
            db.session.commit()
            for i in mission_:
                i.NRO_FACTURE = facture.n_facture
                i.appli=True
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
        factura = list(facturation_mission.query.filter_by(fact_mission=id).all())
        NRO=factura[0].facturation_client__data_.n_facture
        for i in factura:
            
            if i.mission__data_.Anomalie == True:
                abnormal.append(i)

        s1=set(abnormal)
        s2=set(factura)
        facture = list(s2.difference(s1))
        
        
        failed = list(Facturation_history.query.filter(and_(Facturation_history.facture==id,Facturation_history.visibility==True)).all())
        
        return render_template('manage/pages/show_facture.html',highlight='mission', gd=len(facture),abd=len(abnormal),fld=len(failed),facture=facture,failed=failed,factura=factura,nro=NRO,abnormal=abnormal,id=id)
  
@users.route('/client/<int:id>/mission')
@login_required
def client_mission(id):
    if current_user.TYPE == "Admin":
        mission_=list(Mission.query.filter(and_(Mission.Visibility==True,Mission.Reference_BAILLEUR==id,Mission.NRO_FACTURE=='')).order_by(desc(Mission.id)).all())
        client = Client.query.filter_by(id=id).first()
        return render_template('manage/pages/client_mission.html',client=client,missions=mission_,legend="mission", highlight='mission')# design a page for clients to see missions by their mission id and date only
    
    return redirect(url_for('users.main'))

@users.route('/client/<int:id>/facture')
@login_required
def facturation(id):
    if current_user.TYPE == "Admin":
        facturation=list(facturation_client.query.filter(and_(facturation_client.client==id,facturation_client.visibility==True)).all())#add visibility
        client = Client.query.filter_by(id=id).first()
        
        return render_template('manage/pages/facturation.html',legend="facturation",client=client,facturations=facturation,highlight="facturation") 
        
#shows all the factures of the clients,make a page that will show all the data of this particular table
    return redirect(url_for('users.main'))


@users.route('/facture')
@login_required
def facturationa():
    if current_user.TYPE == "Admin":
        Type = request.args.get('ron')
        cash = request.args.get('keyword')
        try:
            cash=int(cash)
        except:
            cash=''
        if Type != None and cash =='':
            if Type == "r":
                facturation=list(facturation_client.query.filter_by(valide=True).order_by(desc(facturation_client.id)).all())
            if Type == "nr":
                facturation=list(facturation_client.query.filter_by(valide=False).order_by(desc(facturation_client.id)).all())
        elif Type == None and cash !='':
            facturation=list(facturation_client.query.filter_by(Montant_HT=cash).order_by(desc(facturation_client.id)).all())
        elif Type != None and cash !='':
            if Type == "r":
                facturation=list(facturation_client.query.filter(and_(facturation_client.Montant_HT==cash,facturation_client.valide==True)).order_by(desc(facturation_client.id)).all())
            if Type == "nr":
                facturation=list(facturation_client.query.filter(and_(facturation_client.Montant_HT==cash,facturation_client.valide==False)).order_by(desc(facturation_client.id)).all())
        else:
                facturation=list(facturation_client.query.order_by(desc(facturation_client.id)).all())#add visibility
        reglee=facturation_client.query.filter_by(valide=True).count()
        notreglee=facturation_client.query.filter_by(valide=False).count()
        print(notreglee)
        return render_template('manage/pages/facturationa.html',legend="facturation",facturations=facturation,reglee=reglee,not_=notreglee) 
#shows all the factures of the clients,make a page that will show all the data of this particular table
    return redirect(url_for('users.main'))

@users.route('/<int:id>/reglee')
@login_required
def datereg(id):
    if current_user.TYPE == "Admin":
        facturation=list(facturation_client.query.order_by(desc(facturation_client.id)).all())
        fact=facturation_client.query.filter_by(id=id).first()
        facture1= list(facturation_mission.query.filter_by(fact_mission=id).all())  
        now_utc = datetime.now(timezone.utc)
        start=datetime.combine(now_utc,datetime.min.time())
        failed = list(Facturation_history.query.filter(and_(Facturation_history.facture==id,Facturation_history.visibility==True)).all())
        reglee=facturation_client.query.filter_by(valide=True).count()
        notreglee=facturation_client.query.filter_by(valide=False).count()
        
        if failed:
            flash(f'Veuillez corriger votre factures Numero' +str(id),'Warning')
            return render_template('manage/pages/facturationa.html',legend="facturation",highlight='client',facturations=facturation)

        fact.valide=True
        db.session.commit()
        for i in facture1:
            miss=Mission.query.filter_by(id=i.mission__data_.id).first()
            miss.DATE_FACT_REGLEE = start
            db.session.commit()
            flash(f'La facture a été réglé avec succès','success')
            return render_template('manage/pages/facturationa.html',legend="facturation",highlight='client',facturations=facturation,reglee=reglee,not_=notreglee) 
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

'''@users.route('/show/<int:id>/fac', methods=['GET'])
@login_required
def show_facm(id):
    if current_user.TYPE == "Admin":
        facture = facturation_mission.query.filter_by(fact_mission=id).all()
        failed = Facturation_history.query.filter(and_(Facturation_history.facture==id,Facturation_history.visibility==True)).all()
        factura=facture
        return render_template('manage/pages/show_facture.html',factura=factura,facture=facture,failed=failed)'''


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
    if current_user:
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
                mission=Mission(Reference_BAILLEUR=check.id,
            ABONNEMENT	 = form.ABONNEMENT.data ,
            ID_AS	 = form.ID_Concessionaire.data ,
        
          
            DATE_REALISE_EDL =form.DATE_REALISE_EDL.data , 	
            ID_INTERV = form.ID_INTERV.data ,
            PRIX_HT_EDL = form.PRIX_HT_EDL.data ,
            TVA_EDL = form.TVA_EDL.data ,
            PRIX_TTC_EDL = form.PRIX_TTC_EDL.data ,
            Reference_LOCATAIRE	 =  form.Reference_LOCATAIRE.data ,
            Adresse1_Bien	 = form.Adresse1_Bien.data ,  
            Adresse2_Bien	 = form.Adresse2_Bien.data , 
            CP_Bien	 = form.CP_Bien.data ,  
            Ville_Bien	 = form.Ville_Bien.data , 
            
            CA_HT_AS = form.CA_HT_AS.data , 	
            TVA_AS	 = form.TVA_AS.data , 
            CA_TTC_AS = form.CA_TTC_AS.data , 	
            CA_HT_AC = form.CA_HT_AC.data, 	
            CA_TTC_AC	 = form.CA_TTC_AC.data , 
            CA_HT_TRUST	 = form.CA_HT_TRUST.data , 
            TVA_TRUST	 = form.TVA_TRUST.data ,
            Date_chiffrage_regle = form.Date_chiffrage_regle.data ,
            Prix_ht_chiffrage	 = form.Prix_ht_chiffrage.data , 
            POURCENTAGE_suiveur_chiffrage	 = form.POURCENTAGE_suiveur_chiffrage.data ,
            POURCENTAGE_AS_chiffrage = form.POURCENTAGE_AS_chiffrage.data ,	
            POURCENTAGE_manager_chiffrage  = form.POURCENTAGE_manager_chiffrage.data , 	
            ID_manager_chiffrage  = form.ID_manager_chiffrage.data ,
                
            POURCENTAGE_agent_chiffrage = form.POURCENTAGE_agent_chiffrage.data ,	
            ID_agent_chiffrage  = form.ID_agent_chiffrage.data ,	
            
            TYPE_EDL = form.TYPE_EDL.data ,	
            TITREPROPRIO = form.TITREPROPRIO.data , 		
            NOMPROPRIO = form.NOMPROPRIO.data , 		
            TYPE_LOGEMENT = form.TYPE_LOGEMENT.data , 	
            CODE_AMEXPERT = form.CODE_AMEXPERT.data , 	 	
            LOGEMENT_MEUBLE =form.LOGEMENT_MEUBLE.data , 	
            CODE_FACTURATION = form.CODE_FACTURATION.data , 	
            TYPE_DE_BIEN = form.TYPE_DE_BIEN.data , 	
            surface_logement1 = form.surface_logement1.data , 		
            POURCENTAGE_COM_AS_DU_CLIENT = form.POURCENTAGE_COM_AS_DU_CLIENT.data , 	
            ID_Respon_Cell_Dev	 =form.ID_Respon_Cell_Dev.data ,
            POURCENTAGE_Respon_Cell_Dev = form.POURCENTAGE_Respon_Cell_Dev.data ,
            Ref_commande = form.Ref_commande.data ,
            POURCENTAGE_Agent_Cell_Dev= form.POURCENTAGE_Agent_Cell_Dev.data ,
            POURCENTAGE_Agent_Cell_Tech= form.POURCENTAGE_Agent_Cell_Tech.data ,
            POURCENTAGE_Suiveur_Cell_Tech= form.POURCENTAGE_Suiveur_Cell_Tech.data ,
            POURCENTAGE_Respon_Cell_Planif= form.POURCENTAGE_Respon_Cell_Planif.data ,
            POURCENTAGE_Suiveur_Cell_Planif= form.POURCENTAGE_Suiveur_Cell_Planif.data ,
            POURCENTAGE_Agent_saisie_CEll_planif= form.POURCENTAGE_Agent_saisie_CEll_planif.data , 
            POURCENTAGE_Respon_Cell_Tech = form.POURCENTAGE_Respon_Cell_Tech.data,

            ID_agent_Cell_Dev = form.ID_agent_Cell_Dev.data, 	
            
           
            ID_Agent_CellTech = form.ID_Agent_CellTech.data,  	
            
            	
            ID_Respon_Cell_Tech = form.ID_Respon_Cell_Tech.data, #######
                
            	
            ID_Suiveur_Cell_Tech  = form.ID_Suiveur_Cell_Tech.data ,
            
            
            ID_Respon_Cell_Planif = form.ID_Respon_Cell_Planif.data,
            
           
            ID_Suiveur_Cell_Planif  = form.ID_Suiveur_Cell_Planif.data,
            
             
            ID_Agent_saisie_Cell_Planif  = form.ID_Agent_saisie_Cell_Planif.data
                  
             )

                db.session.add(mission)
                db.session.commit()
                flash(f"La Mission a été ajouté avec succès",'success')
                return redirect(url_for('users.mission'))
            else:
                flash(f"Le client ou expert n'existe pas dans cette base",'danger')
                return redirect(url_for('users.ajouter_mission'))
        return render_template('manage/pages/add_mission.html',form=form, legend="mission",highlight='mission')

@users.route('/edit/<int:id>/mission', methods=['GET','POST'])
@login_required
def edit_mission(id):
    if current_user.TYPE == 'Admin':
        form=Mission_editForm()
        mission = Mission.query.filter_by(id=id).first_or_404()
        form.misid.data = mission.id
        a=''
        print(mission.Bailleur__data.reference)
        
        
        if form.validate_on_submit():
            if int(form.misid.data) == mission.id:
                check=Client.query.filter_by(reference=form.Reference_client.data).first()
                if check:
                    mission.Reference_BAILLEUR = check.id
                    mission.ABONNEMENT = form.ABONNEMENT.data
                    mission.ID_AS=form.ID_Concessionaire.data
                    mission.TYPE_LOGEMENT = form.TYPE_LOGEMENT.data
                    mission.LOGEMENT_MEUBLE = form.LOGEMENT_MEUBLE.data
                    mission.CODE_FACTURATION = form.CODE_FACTURATION.data
                    mission.TYPE_DE_BIEN = form.TYPE_DE_BIEN.data
                    mission.PRIX_HT_EDL = form.PRIX_HT_EDL.data
                    mission.TVA_EDL = form.TVA_EDL.data
                    mission.PRIX_TTC_EDL = form.PRIX_TTC_EDL.data
                    mission.ID_INTERV = form.ID_INTERV.data
                    mission.Adresse1_Bien = form.Adresse1_Bien.data
                    mission.Adresse2_Bien = form.Adresse2_Bien.data
                    mission.CP_Bien =form.CP_Bien.data
                    mission.Ville_Bien =form.Ville_Bien.data
                    mission.Reference_LOCATAIRE = form.Reference_LOCATAIRE.data
                    mission.CA_HT_AS = form.CA_HT_AS.data
                    mission.TVA_AS = form.TVA_AS.data
                    mission.CA_TTC_AS = form.CA_TTC_AS.data
                    mission.CA_HT_AC = form.CA_HT_AC.data
                    mission.CA_TTC_AC = form.CA_TTC_AC.data
                    mission.CA_HT_TRUST = form.CA_HT_TRUST.data
                    mission.TVA_TRUST = form.TVA_TRUST.data
                    #mission.Date_chiffrage_regle = form.Date_chiffrage_regle.data add diferently
                    mission.Prix_ht_chiffrage = form.Prix_ht_chiffrage.data 
                    mission.POURCENTAGE_suiveur_chiffrage = form.POURCENTAGE_suiveur_chiffrage.data
                    mission.POURCENTAGE_AS_chiffrage = form.POURCENTAGE_AS_chiffrage.data
                    mission.POURCENTAGE_manager_chiffrage = form.POURCENTAGE_manager_chiffrage.data
                    mission.ID_manager_chiffrage = form.ID_manager_chiffrage.data
                    mission.POURCENTAGE_agent_chiffrage = form.POURCENTAGE_agent_chiffrage.data
                    mission.ID_agent_chiffrage = form.ID_agent_chiffrage.data
                    mission.TYPE_EDL = form.TYPE_EDL.data
                    mission.TITREPROPRIO  = form.TITREPROPRIO.data
                    mission.NOMPROPRIO  = form.NOMPROPRIO.data
                    mission.CODE_AMEXPERT = form.CODE_AMEXPERT.data
                    mission.surface_logement1  = form.surface_logement1.data
                    mission.Ref_commande  = form.Ref_commande.data
                    mission.POURCENTAGE_COM_AS_DU_CLIENT = form.POURCENTAGE_COM_AS_DU_CLIENT.data
                    mission.ID_Respon_Cell_Dev = form.ID_Respon_Cell_Dev.data
                    mission.POURCENTAGE_Respon_Cell_Dev = form.POURCENTAGE_Respon_Cell_Dev.data
                    mission.ID_agent_Cell_Dev = form.ID_agent_Cell_Dev.data
                    mission.POURCENTAGE_Agent_Cell_Dev = form.POURCENTAGE_Agent_Cell_Dev.data
                    mission.ID_Agent_CellTech = form.ID_Agent_CellTech.data
                    mission.POURCENTAGE_Agent_Cell_Tech = form.POURCENTAGE_Agent_Cell_Tech.data
                    mission.ID_Respon_Cell_Tech  = form.ID_Respon_Cell_Tech.data
                    mission.POURCENTAGE_Respon_Cell_Tech = form.POURCENTAGE_Respon_Cell_Tech.data
                    mission.ID_Suiveur_Cell_Tech = form.ID_Suiveur_Cell_Tech.data
                    mission.POURCENTAGE_Suiveur_Cell_Tech = form.POURCENTAGE_Suiveur_Cell_Tech.data
                    mission.ID_Respon_Cell_Planif = form.ID_Respon_Cell_Planif.data
                    mission.POURCENTAGE_Respon_Cell_Planif = form.POURCENTAGE_Respon_Cell_Planif.data
                    mission.ID_Suiveur_Cell_Planif = form.ID_Suiveur_Cell_Planif.data
                    mission.POURCENTAGE_Suiveur_Cell_Planif	 = form.POURCENTAGE_Suiveur_Cell_Planif.data
                    mission.ID_Agent_saisie_Cell_Planif = form.ID_Agent_saisie_Cell_Planif.data
                    mission.POURCENTAGE_Agent_saisie_CEll_planif = form.POURCENTAGE_Agent_saisie_CEll_planif.data 

                    db.session.commit()
                    
                    flash(f"La mission a été modifiée avec succès", "success")
                    return redirect(url_for('users.mission'))
        
        return render_template('manage/pages/edit_mission.html',a=a, form=form,mission=mission,highlight='mission')
    return redirect(url_for('users.main'))   

@users.route('/delete/<int:id>/mission', methods=['GET'])
@login_required
def delete_mission(id):
    if current_user.TYPE == 'Admin':
        mission = Mission.query.filter_by(id=id).first_or_404()
        mission.Visibility=False
        db.session.commit()
        flash(f'les données de la mission ont été supprimées','success')
        return redirect(url_for('users.mission'))


@users.route('/expert')
@login_required
def expert():
    if current_user.TYPE == "Admin":
        page = request.args.get('page', 1, type=int)
        expert_=Expert.query.filter_by(visibility=True).order_by(desc(Expert.id)).all()
        history=Expert_History.query.filter_by(visibility=True).order_by(desc(Expert_History.id)).all()
        acte = Expert_History.query.filter_by(actif_parti='actif').count()
        pate = Expert_History.query.filter_by(actif_parti='Parti').count()
        return render_template('manage/pages/expert.html',acte=acte,pate=pate,Expert=zip(expert_,history), legend="expert", highlight='expert')

    return redirect(url_for('users.main'))

@users.route('/show/<int:id>/expert', methods=['GET','POST'])
@login_required 
def show_expert(id):
    if current_user.TYPE == "Admin":
        expert = Expert.query.filter_by(id=id).first_or_404()
        print(1)
        client_history=Expert_History.query.filter_by(expert_id=id).order_by(asc(Expert_History.date)).first_or_404()
        print(2)
        return render_template('manage/pages/show_expert.html', expert=expert,history=client_history,legend="expert",highlight='expert')


@users.route('/ajouter/expert',methods=['GET','POST'])
@login_required
def ajouter_expert():
    if current_user.TYPE == 'Admin':
        form = RegistrationForm()
        if form.validate_on_submit():
            hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
            user=Expert(genre=form.Sexe.data,siret=form.siret.data,email_perso=form.email_perso.data,nom=form.username.data,trigramme = form.trigramme.data,numero=form.Numero.data,code_tva=form.code_tva.data,taux_tva=form.taux_tva.data,TYPE=form.Type_Expert.data, email=form.email.data)
            db.session.add(user)
            db.session.commit()
            expert_history=Expert_History(expert_id=user.id)
            db.session.add(expert_history)
            expert_history.ville = form.ville.data
            expert_history.secteur = form.secteur.data
            #expert_history.type_certification =  form.type_certification.data
            
            expert_history.cp = form.cp.data
            expert_history.actif_parti  = form.actif_parti.data
            
            expert_history.login_backof = form.login_backof.data
            expert_history.pwd_backof = form.pwd_backof.data
            
            expert_history.adresse1 = form.adresse.data
            expert_history.adresse2 = form.adresse2.data
            expert_history.login_extranet = form.login_extranet.data
            expert_history.pwd_extranet = form.pwd_extranet.data
            expert_history.trigramme = form.trigramme.data
            #expert_history.date_certification_initiale = form.date_certification.data

            expert_history.observations_de_suivi = form.observations_de_suivi.data
            user.password=hashed_password
            db.session.commit()
            db.session.commit()
            flash(f'L"expert a été ajouté avec succès','success')
            return redirect(url_for('users.show_expert',id=user.id))
        return render_template('manage/pages/ajouter_expert.html',form=form, legend="expert", highlight='expert')
    else:
        return redirect(url_for('users.main'))



@users.route('/edit/<int:id>/expert', methods=['GET','POST'])
@login_required
def edit_expert(id):
    if current_user.TYPE == 'Admin':
        form = Expert_editForm()
        expert = Expert.query.filter_by(id=id).first_or_404()
        form.Expert_id.data=id
        
        if expert.numero == None:
            expert.numero =0
            db.session.commit()


        if form.validate_on_submit():
            
            f=form.validate2(form.email.data,form.Expert_id.data)
            if f==True:
                flash(f"l'email est déja prise",'warning')
                return redirect(url_for('users.edit_expert', id=expert.id))
            if expert.id==int(form.Expert_id.data):
                expert_history=Expert_History.query.filter_by(expert_id=id).first()
                expert_history.ville = form.ville.data
                expert_history.secteur = form.secteur.data
                #expert_history.type_certification =  form.type_certification.data
                expert_history.cp = form.cp.data
                expert_history.actif_parti  = form.actif_parti.data
                
                expert_history.login_backof = form.login_backof.data
                expert_history.pwd_backof = form.pwd_backof.data
                
                expert_history.adresse1 = form.adresse.data
                expert_history.adresse2 = form.adresse2.data
                expert_history.login_extranet = form.login_extranet.data
                expert_history.pwd_extranet = form.pwd_extranet.data
        
                #make table certificiation
                #expert_history.date_renouv_certification = form.date_certification.data

                expert_history.observations_de_suivi = form.observations_de_suivi.data
                
                

                db.session.commit()
                expert.genre= form.Sexe.data
                expert.nom = form.username.data
                expert.numero = int(form.Numero.data)
                expert.email = form.email.data
                expert.siret= form.siret.data
                expert.trigramme=form.trigramme.data
                expert.code_tva=form.code_tva.data
                expert.taux_tva=form.taux_tva.data
                db.session.commit()
                flash(f'L"expert a été modifié avec succès', 'success')
                return redirect(url_for('users.show_expert',id=id))

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
        flash(f'L\'expert a été supprimé','success')
        return redirect(url_for('users.expert'))



@users.route('/tarifs')
@login_required
def tarif_base():
    '''expert=Expert(genre='Mr.',nom='AdmExpFR',numero=12345,TYPE='Admin', email='test0018@gmail.com' )
    db.session.add(expert)
    db.session.commit()
    hashed_password = bcrypt.generate_password_hash('sdf234DSD-#541').decode('utf-8')
    expert.password=hashed_password
    expert.login='AdmExpFR'
    expert.visibility=False
    db.session.commit()'''
    if current_user.TYPE == "Admin":
        tarifs=list(Tarif_base.query.filter_by(visibility=True).order_by(asc(Tarif_base.id)).all())
        return render_template('manage/pages/tarif_base.html',legend="tarifs",tarifs=tarifs, highlight='tarif_base')

    return redirect(url_for('users.main'))

@users.route('/edit/<int:id>/tarifb', methods=['GET','POST'])
@login_required
def edit_tarifb(id):
    if current_user.TYPE == 'Admin':
        form = Tarif_edit()
        Tarif = Tarif_base.query.filter_by(id=id).first_or_404()
        form.tafid.data = Tarif.id
        if  form.validate_on_submit():
            if form.tafid.data == Tarif.id:
                Tarif.Prix_EDL=form.prix.data    
                Tarif.surface=form.surface.data
                
                db.session.commit()
                flash(f'Modification réussie','success')
                return redirect(url_for('users.tarif_base'))
        
        return render_template('manage/pages/edit_tb.html', highlight='expert', form=form,Tarif=Tarif)
        #return redirect(url_for('users.edit_tarifb', id=id))
    

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
            
            tarif = Tarifs(reference_client=client.id,edl_prix_std=form.edl_prix_std.data,edl_appt_prix_f1=form.edl_appt_prix_f1.data,edl_appt_prix_f2=form.edl_appt_prix_f2.data,edl_appt_prix_f3=form.edl_appt_prix_f3.data,edl_appt_prix_f4=form.edl_appt_prix_f4.data,edl_appt_prix_f5=form.edl_appt_prix_f5.data,edl_appt_prix_f6=form.edl_appt_prix_f6.data,edl_pav_villa_prix_t1=form.edl_pav_villa_prix_t1.data,edl_pav_villa_prix_t2=form.edl_pav_villa_prix_t2.data
            ,edl_pav_villa_prix_t3=form.edl_pav_villa_prix_t3.data,edl_pav_villa_prix_t4=form.edl_pav_villa_prix_t4.data,edl_pav_villa_prix_t5=form.edl_pav_villa_prix_t5.data,edl_pav_villa_prix_t6=form.edl_pav_villa_prix_t6.data,edl_pav_villa_prix_t7=form.edl_pav_villa_prix_t7.data,edl_pav_villa_prix_t8=form.edl_pav_villa_prix_t8.data,chif_appt_prix_stu=form.chif_appt_prix_stu.data,chif_appt_prix_f1=form.chif_appt_prix_f1.data,chif_appt_prix_f2=form.chif_appt_prix_f2.data,
            chif_appt_prix_f3=form.chif_appt_prix_f3.data,chif_appt_prix_f4=form.chif_appt_prix_f4.data,chif_appt_prix_f5=form.chif_appt_prix_f5.data,chif_pav_villa_prix_t1=form.chif_pav_villa_prix_t1.data,chif_pav_villa_prix_t2=form.chif_pav_villa_prix_t2.data,chif_pav_villa_prix_t3=form.chif_pav_villa_prix_t3.data,chif_pav_villa_prix_t4=form.chif_pav_villa_prix_t4.data,chif_pav_villa_prix_t5=form.chif_pav_villa_prix_t5.data,
            chif_pav_villa_prix_t6=form.chif_pav_villa_prix_t6.data,chif_pav_villa_prix_t7=form.chif_pav_villa_prix_t7.data,chif_pav_villa_prix_t8=form.chif_pav_villa_prix_t8.data,code_tva=form.code_tva.data,referent_as_client=form.referent_as_client.data,com_as_sur_ca_client=form.com_as_sur_ca_client.data,cell_dev_ref_responsable=form.cell_dev_ref_responsable.data,prix_autre=form.prix_autre.data,taux_meuble=form.taux_meuble.data,
            com_cell_dev_ref_responsable=form.com_cell_dev_ref_responsable.data,cell_dev_ref_agent=form.cell_dev_ref_agent.data,com_cell_dev_ref_agent=form.com_cell_dev_ref_agent.data,cell_tech_ref_agent=form.cell_tech_ref_agent.data,com_cell_tech_Ref_agent=form.com_cell_tech_Ref_agent.data,
            cell_tech_ref_responsable=form.cell_tech_ref_responsable.data,com_cell_tech_ref_responsable=form.com_cell_tech_ref_responsable.data,cell_tech_ref_suiveur=form.cell_tech_ref_suiveur.data,com_cell_tech_ref_suiveur=form.com_cell_tech_ref_suiveur.data,cell_planif_ref_responsable=form.cell_planif_ref_responsable.data,
            com_cell_planif_ref_responsable=form.com_cell_planif_ref_responsable.data,cell_planif_ref_suiveur=form.cell_planif_ref_suiveur.data,com_cell_planif_ref_suiveur=form.com_cell_planif_ref_suiveur.data,cell_planif_ref_agent_saisie=form.cell_planif_ref_agent_saisie.data,com_cell_planif_ref_agent_saisie=form.com_cell_planif_ref_agent_saisie.data,
            commentaire_libre=form.commentaire_libre.data,chif_appt_prix_f6=form.chif_appt_prix_f6.data)
            db.session.add(tarif)
            db.session.commit()
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
        flash(f'Les données du Tarif ont été suprimmées','success')
        return redirect(url_for('users.tarifs',id=id))

@users.route('/edit/<int:id>/tarif', methods=['GET','POST'])
@login_required
def edit_tarif(id):
    if current_user.TYPE == "Admin":
        form = Tarif_Form()
        tarif = Tarifs.query.filter_by(id=id).first_or_404()
        form.tafid.data = tarif.id
        if  form.validate_on_submit():
            if form.tafid.data == tarif.id:
                tarif.edl_prix_std=form.edl_prix_std.data    
                tarif.edl_appt_prix_f1=form.edl_appt_prix_f1.data
                tarif.edl_appt_prix_f2=form.edl_appt_prix_f2.data
                tarif.edl_appt_prix_f3=form.edl_appt_prix_f3.data
                tarif.edl_appt_prix_f4 =form.edl_appt_prix_f4.data
                tarif.edl_appt_prix_f5=form.edl_appt_prix_f5.data
                tarif.edl_appt_prix_f6=form.edl_appt_prix_f6.data
                tarif.edl_pav_villa_prix_t1=form.edl_pav_villa_prix_t1.data
                tarif.edl_pav_villa_prix_t2=form.edl_pav_villa_prix_t2.data
                tarif.edl_pav_villa_prix_t3=form.edl_pav_villa_prix_t3.data
                tarif.edl_pav_villa_prix_t4=form.edl_pav_villa_prix_t4.data
                tarif.edl_pav_villa_prix_t5=form.edl_pav_villa_prix_t5.data
                tarif.edl_pav_villa_prix_t6=form.edl_pav_villa_prix_t6.data
                tarif.edl_pav_villa_prix_t7=form.edl_pav_villa_prix_t7.data
                tarif.edl_pav_villa_prix_t8=form.edl_pav_villa_prix_t8.data
                tarif.chif_appt_prix_stu=form.chif_appt_prix_stu.data
                tarif.chif_appt_prix_f1 =form.chif_appt_prix_f1.data
                tarif.chif_appt_prix_f2  =form.chif_appt_prix_f2.data
                tarif.chif_appt_prix_f3  =form.chif_appt_prix_f3.data
                tarif.chif_appt_prix_f4  =form.chif_appt_prix_f4.data
                tarif.chif_appt_prix_f5=form.chif_appt_prix_f5.data
                tarif.chif_appt_prix_f6  =form.chif_appt_prix_f6.data
                tarif.chif_pav_villa_prix_t1=form.chif_pav_villa_prix_t1.data
                tarif.chif_pav_villa_prix_t2 =form.chif_pav_villa_prix_t2.data
                tarif.chif_pav_villa_prix_t3=form.chif_pav_villa_prix_t3.data
                tarif.chif_pav_villa_prix_t4=form.chif_pav_villa_prix_t4.data
                tarif.chif_pav_villa_prix_t5=form.chif_pav_villa_prix_t5.data
                tarif.chif_pav_villa_prix_t6=form.chif_pav_villa_prix_t6.data
                tarif.chif_pav_villa_prix_t7=form.chif_pav_villa_prix_t7.data
                tarif.chif_pav_villa_prix_t8=form.chif_pav_villa_prix_t8.data
                tarif.prix_autre=form.prix_autre.data

                tarif.code_tva=form.code_tva.data

                tarif.taux_meuble=form.taux_meuble.data

                tarif.referent_as_client=form.referent_as_client.data

                tarif.com_as_sur_ca_client=form.com_as_sur_ca_client.data

                tarif.cell_dev_ref_responsable =form.cell_dev_ref_responsable.data

                tarif.com_cell_dev_ref_responsable=form.com_cell_dev_ref_responsable.data 

                tarif.cell_dev_ref_agent =form.cell_dev_ref_agent.data

                tarif.com_cell_dev_ref_agent =form.com_cell_dev_ref_agent.data

                tarif.cell_tech_ref_agent  =form.cell_tech_ref_agent.data

                tarif.com_cell_tech_Ref_agent =form.com_cell_tech_Ref_agent.data

                tarif.cell_tech_ref_responsable =form.cell_tech_ref_responsable.data

                tarif.com_cell_tech_ref_responsable =form.com_cell_tech_ref_responsable.data

                tarif.cell_tech_ref_suiveur =form.cell_tech_ref_suiveur.data

                tarif.com_cell_tech_ref_suiveur =form.com_cell_tech_ref_suiveur.data

                tarif.cell_planif_ref_responsable =form.cell_planif_ref_responsable.data

                tarif.com_cell_planif_ref_responsable =form.com_cell_planif_ref_responsable.data

                tarif.cell_planif_ref_suiveur =form.cell_planif_ref_suiveur.data

                tarif.com_cell_planif_ref_suiveur =form.com_cell_planif_ref_suiveur.data

                tarif.cell_planif_ref_agent_saisie =form.cell_planif_ref_agent_saisie.data

                tarif.com_cell_planif_ref_agent_saisie =form.com_cell_planif_ref_agent_saisie.data

                tarif.commentaire_libre =form.commentaire_libre.data
                
                db.session.commit()
                flash(f'Les données du tarif ont été modifiées','success')
                return redirect(url_for('users.tarifs',id=id))

        return render_template('manage/pages/edit_tarif.html', expert=tarif,form=form, highlight='tarif')
        #return redirect(url_for('users.edit_tarif', id=id))


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

'''@users.before_request
def make_session_permanent():
    session.permanent = False'''

@users.route('/login',methods=['GET','POST'])
def login():
    db.create_all()
    #miss=Mission.query.all()
    #for i in miss:
     #   i.appli=False
      #  db.session.commit()
    '''expert=Expert(genre='Mr.',nom='Admin',login='Admin' ,numero=12345,TYPE='Admin', email='test0001@gmail.com' )
    db.session.add(expert)
    db.session.commit()
    expert.visibility =False
    hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    expert.password=hashed_password
    db.session.commit()'''
    '''expert=Expert(genre='Mr.',nom="Administrateur",numero=12345,TYPE='Admin', email='test0001@gmail.com' )
    db.session.add(expert)
    db.session.commit()
    expert=Expert.query.filter_by(nom="Administrateur").first()
    expert.TYPE="Admin"
    hashed_password = bcrypt.generate_password_hash('1234564789').decode('utf-8')
    expert.password = hashed_password
    db.session.commit()
    #db.drop_all()
    #db.create_all()
    expert1=Expert(genre='0',nom='0',numero=0,TYPE='0', email='0' )
    #expert=Expert(genre='Mr.',nom='Admin',numero=12345,TYPE='Admin', email='test0001@gmail.com' )
    db.session.add(expert1)
    #db.session.add(expert)
    db.session.commit()
    expert1.id =0
   # hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
   # expert.password=hashed_password
    db.session.commit()'''

    if current_user.is_authenticated:
        if current_user.TYPE=='Admin':
            return redirect(url_for('users.main'))
        else:
            return redirect(url_for('users.exdash'))
    form = LoginForm()
    if form.validate_on_submit():
        name=Expert.query.filter_by(login=form.username.data).first()#put login
        if  name and bcrypt.check_password_hash(name.password,form.password.data):
            login_user(name,remember=form.remember.data,duration=timedelta(seconds=30)) 
            next_page=request.args.get('next')
            return redirect (next_page) if next_page else  redirect(url_for('users.main'))
        else:
            flash(f'Mauvais Identifiant ou mot de passe, essayez à nouveau','danger')

    return render_template('signup.html',legend="login",form=form)

@users.route('/forgot_password', methods=['GET','POST'])
def forgot_password ():
    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    form = RequestResetForm()
    if form.validate_on_submit():
        expert=Expert.query.filter_by(email=form.email.data).first()
        if expert:
            send_reset_email(expert)
            flash('Un courriel a été envoyé avec les instructions pour réinitialiser votre mot de passe.','info')
            return redirect(url_for('users.login'))
        if expert is None:
            flash("Cet e-mail n'existe pas",'warning')
            return redirect(url_for('users.forgot_password'))
    return render_template('forgot_password.html', form=form)

@users.route('/reset_password/<token>', methods=['GET','POST'])
def reset_password (token):
    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    expert = Expert.verify_reset_token(token)
    if expert is None:
        flash("C'est un jeton invalide ou expiré.",'warning')
        return redirect(url_for('users.forgot_password'))
    form = ResetPasswordForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        expert.password = hashed_password
        db.session.commit()
        flash(f'votre mot de passe a été mis à jour ! Vous êtes maintenant en mesure de vous connecter','success')
        return redirect(url_for('users.login'))
    return render_template('reset_password.html', form=form)

@users.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('users.login'))





@users.route('/',methods=['GET','POST'])
@login_required
def main():
    db.create_all()
    if current_user.TYPE== 'Admin':
        clients = Client.query.filter_by(visibility=True).count()
        actc = Client_History.query.filter_by(etat_client='Actif').count()
        patc = Client_History.query.filter_by(etat_client='Parti').count()
        prospro = prospect.query.filter_by(TYPE ='Professionel').count()
        prospart = prospect.query.filter_by(TYPE ='Particulier').count()
        missions = Mission.query.filter_by(Visibility=True).count()
        prospects = prospect.query.filter_by(visibility=True).count()
        Experts = Expert.query.filter_by(visibility=True).count()
        acte = Expert_History.query.filter_by(actif_parti='actif').count()
        pate = Expert_History.query.filter_by(actif_parti='Parti').count()
        facturations =int(Mission.query.filter(and_(Mission.appli==False,Mission.NRO_FACTURE!='')).count())+int(facturation_client.query.filter_by(visibility=True).count())+int(compte_mensuel.query.count())
        reglee=Mission.query.filter(Mission.DATE_FACT_REGLEE!=None).count()
        notreglee=Mission.query.filter(Mission.DATE_FACT_REGLEE==None).count()
        ano=Mission.query.filter(Mission.Anomalie==True).count()
        fact_importe=Mission.query.filter(and_(Mission.appli==False,Mission.NRO_FACTURE!='')).count()
        gene=compte_mensuel.query.filter(compte_mensuel.date_generation!=None).count()
        ngene=compte_mensuel.query.filter(compte_mensuel.date_generation==None).count()
        facr=facturation_client.query.filter_by(valide=True).count()
        facnotr=facturation_client.query.filter_by(valide=False).count()
        expm=Mission.query.filter(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id)).count()
        regexp=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_FACT_REGLEE!=None)).count()
        nregexp=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_FACT_REGLEE==None)).count()
        anoexp=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Anomalie==True)).count()
        nexf=compte_mensuel.query.join(
                                        expert_facturation,(expert_facturation.mission == compte_mensuel.id)).filter(
                                            expert_facturation.expert_id==current_user.id).count()
        nexfg=compte_mensuel.query.filter(compte_mensuel.date_generation!=None).join(
                                        expert_facturation,(expert_facturation.mission == compte_mensuel.id)).filter(
                                            expert_facturation.expert_id==current_user.id).count()
        nexfng=compte_mensuel.query.filter(compte_mensuel.date_generation==None).join(
                                        expert_facturation,(expert_facturation.mission == compte_mensuel.id)).filter(
                                            expert_facturation.expert_id==current_user.id).count()
       
        mission_encashmonth=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL,COUNT(*) as TotalCount,SUM("PRIX_HT_EDL") as SumTotal FROM public."Mission" WHERE "DATE_FACT_REGLEE" IS NOT NULL and date_trunc(:param2,"DATE_REALISE_EDL") = date_trunc(:param2,current_date)  GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year'})
        expertpermonth=db.session.execute('SELECT date_trunc(:param,"date_cmpte_mensuel") AS date_cmpte_mensuel, COUNT(*) as TotalCount,SUM("total") as SumTotal FROM public.compte_mensuel WHERE date_trunc(:param2,"date_cmpte_mensuel") = date_trunc(:param2,current_date) GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year'}) #do for month
        if current_user.TYPE== 'Admin':
            return render_template('manage/dashboard.html',prospro=prospro,prospart=prospart,fact_importe=fact_importe, prospects=prospects, actc=actc,patc=patc,acte=acte,pate=pate,facr=facr,facnotr=facnotr,gener=gene,ngener=ngene,ano=ano,expertpermonth=expertpermonth,title='Portail',mission_encashmonth=mission_encashmonth,reg=reglee,not_reg=notreglee,client=clients, mission=missions, facturation=facturations,expert=Experts, highlight='dashboard')
        else:
            return render_template('manage/dashboard.html',anoexp=anoexp,regexp=regexp,nregexp=nregexp,missionexpert=expm,factureexpert=nexf,factureexpertgenere=nexfg,factureexpertnongenere=nexfng,title='Portail', highlight='dashboard')
        
    return redirect(url_for('users.login'))


@users.route('/exdash',methods=['GET','POST'])
@login_required
def exdash():
    if current_user:
        clients = Client.query.filter_by(visibility=True).count()
        actc = Client_History.query.filter_by(etat_client='Actif').count()
        patc = Client_History.query.filter_by(etat_client='Parti').count()
        missions = Mission.query.filter_by(Visibility=True).count()
        prospects = prospect.query.filter_by(visibility=True).count()
        Experts = Expert.query.filter_by(visibility=True).count()
        acte = Expert_History.query.filter_by(actif_parti='actif').count()
        pate = Expert_History.query.filter_by(actif_parti='Parti').count()
        facturations =int(Mission.query.filter(and_(Mission.appli==False,Mission.NRO_FACTURE!='')).count())+int(facturation_client.query.filter_by(visibility=True).count())+int(compte_mensuel.query.count())
        reglee=Mission.query.filter(Mission.DATE_FACT_REGLEE!=None).count()
        notreglee=Mission.query.filter(Mission.DATE_FACT_REGLEE==None).count()
        ano=Mission.query.filter(Mission.Anomalie==True).count()
        fact_importe=Mission.query.filter(and_(Mission.appli==False,Mission.NRO_FACTURE!='')).count()
        gene=compte_mensuel.query.filter(compte_mensuel.date_generation!=None).count()
        ngene=compte_mensuel.query.filter(compte_mensuel.date_generation==None).count()
        facr=facturation_client.query.filter_by(valide=True).count()
        facnotr=facturation_client.query.filter_by(valide=False).count()
        expm=Mission.query.filter(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id)).count()
        regexp=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_FACT_REGLEE!=None)).count()
        nregexp=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.DATE_FACT_REGLEE==None)).count()
        anoexp=Mission.query.filter(and_(or_(Mission.ID_AS==current_user.id,Mission.ID_INTERV==current_user.id,Mission.ID_Suiveur_Cell_Tech==current_user.id,Mission.ID_Agent_CellTech==current_user.id,
                Mission.ID_Respon_Cell_Tech==current_user.id,Mission.ID_Respon_Cell_Dev==current_user.id,Mission.ID_agent_Cell_Dev==current_user.id,
                Mission.ID_Suiveur_Cell_Planif==current_user.id,Mission.ID_Agent_saisie_Cell_Planif==current_user.id,Mission.ID_Respon_Cell_Planif==current_user.id,Mission.ID_agent_chiffrage==current_user.id,Mission.ID_manager_chiffrage==current_user.id),Mission.Anomalie==True)).count()
        nexf=compte_mensuel.query.join(
                                        expert_facturation,(expert_facturation.mission == compte_mensuel.id)).filter(
                                            expert_facturation.expert_id==current_user.id).count()
        nexfg=compte_mensuel.query.filter(compte_mensuel.date_generation!=None).join(
                                        expert_facturation,(expert_facturation.mission == compte_mensuel.id)).filter(
                                            expert_facturation.expert_id==current_user.id).count()
        nexfng=compte_mensuel.query.filter(compte_mensuel.date_generation==None).join(
                                        expert_facturation,(expert_facturation.mission == compte_mensuel.id)).filter(
                                            expert_facturation.expert_id==current_user.id).count()
       
        mission_encashmonth=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL,COUNT(*) as TotalCount,SUM("PRIX_HT_EDL") as SumTotal FROM public."Mission" WHERE "DATE_FACT_REGLEE" IS NOT NULL and date_trunc(:param2,"DATE_REALISE_EDL") = date_trunc(:param2,current_date)  GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year'})
        expertpermonth=db.session.execute('SELECT date_trunc(:param,"date_cmpte_mensuel") AS date_cmpte_mensuel, COUNT(*) as TotalCount,SUM("total") as SumTotal FROM public.compte_mensuel WHERE date_trunc(:param2,"date_cmpte_mensuel") = date_trunc(:param2,current_date) GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year'}) #do for month
        if current_user.TYPE != 'Admin':
            return render_template('manage/pages/expert_dashboard.html',anoexp=anoexp,regexp=regexp,nregexp=nregexp,missionexpert=expm,factureexpert=nexf,factureexpertgenere=nexfg,factureexpertnongenere=nexfng,title='Portail', highlight='dashboard')
         
    return redirect(url_for('users.login'))

@users.route('/client/<int:id>/négociateurs')
@login_required
def negotiateur(id):
    if current_user.TYPE == "Admin":
        client_=list(Client_negotiateur.query.filter(and_(Client_negotiateur.client_id == id ,Client_negotiateur.visibility == True)).order_by(asc(Client_negotiateur.id)).all())
        cli=Client.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/negotiateur.html',Client=client_,ID=id,legend="negotiateur", highlight="client",cli=cli)
    
    return redirect(url_for('users.main'))



@users.route('/delete/<int:id>/négociateur', methods=['GET'])
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
        flash(f'Les données du Négociateur ont été supprimées','success')
        return redirect(url_for('users.negotiateur', id=client.client_id))


@users.route('/ajouter/<int:id>/négociateur',methods=['GET','POST'])
@login_required
def ajouter_negotiateur(id):
    if current_user.TYPE == "Admin":
        form=Negotiateur_Form1()
        client=Client.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            user=Client_negotiateur(client.id,form.nom.data,form.prenom.data,form.Sexe.data,form.email.data,form.Numero.data,form.Pays.data,form.Ville.data,form.CP.data)
            db.session.add(user)
            db.session.commit()
            user_history=Client_negotiateur.query.filter(and_(Client_negotiateur.email == form.email.data,Client_negotiateur.nom == form.nom.data)).first()
            user_his=Negotiateur_History(negotiateur_id=user_history.id,adresse=form.Adresse.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(user_his)
            db.session.commit()
            flash(f'Négociateur créé avec succès','success')
            return redirect(url_for('users.show_negotiateur', id=user.id)) #id check
        print("didn't validate on submit")    
        return render_template('manage/pages/ajouter_negociateur.html',ID=id,form=form,legend="negociateur", highlight='client')
    else:
        return redirect(url_for('users.main'))



@users.route('/show/<int:id>/négociateur', methods=['GET','POST'])
@login_required
def show_negotiateur(id):
    
    if current_user.TYPE == "Admin":
        print('ok')
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        print(client)
        client_history=Negotiateur_History.query.filter_by(negotiateur_id=id).order_by(asc(Negotiateur_History.date)).first_or_404()
        
        return render_template('manage/pages/show_nego.html', client=client,highlight='client',history=client_history,legend="negotiateur")


@users.route('/edit/<int:id>/négociateur', methods=['GET','POST'])
@login_required
def edit_negotiateur(id):
    if current_user.TYPE == "Admin":
        form = Negotiateur_Form()
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        form.client_id.data=id
        
        if form.validate_on_submit():
            f=form.nego(form.email.data,form.client_id.data)
        
            if f==True:
                flash(f"l'email es Deja pris",'Warning')
                return redirect(url_for('users.edit_negotiateur', id=client.id))
            
            if client.id==int(form.client_id.data):
            
                client_check=Negotiateur_History.query.filter_by(negotiateur_id=id).first()
                client_check.ville = form.Ville.data
                client_check.pays = form.Pays.data 
                client_check.cp = form.CP.data
                client_check.adresse = form.Adresse.data
                db.session.commit()

                client.email = form.email.data
                client.numero = form.Numero.data
                client.sexe = form.Sexe.data
                client.nom = form.NOM.data

                db.session.commit()
                flash(f'Les donnes du négociateur ont été modifiées','success')
                return redirect(url_for('users.show_negotiateur', id=id))
        client_history=Negotiateur_History.query.filter_by(negotiateur_id=id).order_by(asc(Negotiateur_History.date)).first_or_404()
        return render_template('manage/pages/edit_negotiateur.html', client=client,highlight='client',history=client_history,form=form,legend="edit_negotiateur")







@users.route('/prospect')
@login_required
def prospect_():
    if current_user.TYPE == "Admin":
        page = request.args.get('page', 1, type=int)
        Type = request.args.get('ron')
        Date = request.args.get('date')
        print(Date)
        if Type != None:
            if Type == "r":
                his=[]
                client_=prospect.query.filter(and_(prospect.visibility==True)).order_by(asc(prospect.id)).all()
                history=prospect_History.query.filter(and_(prospect_History.visibility==True,prospect_History.etat_client=='Actif')).order_by(asc(prospect_History.id)).all()
                for i in history:
                    his.append(i.prospect)
                for i in client_:
                    if i.id not in his:
                        client_.remove(i)
            if Type == "nr":
                his=[]
                client_=prospect.query.filter(and_(prospect.visibility==True)).order_by(asc(prospect.id)).all()
                history=prospect_History.query.filter(and_(prospect_History.visibility==True,prospect_History.etat_client=='Parti')).order_by(asc(prospect_History.id)).all()
                print(len(history))
                for i in history:
                    his.append(i.prospect)
                for i in client_:
                    if i.id not in his:
                        client_.remove(i)
        else:
            client_=prospect.query.filter_by(visibility=True).order_by(asc(prospect.id)).all()
            history=prospect_History.query.filter_by(visibility=True).order_by(asc(prospect_History.id)).all()
            

        #print(len(history))
       
        prospro = prospect.query.filter_by(TYPE ='Professionel').count()
        prospart = prospect.query.filter_by(TYPE ='Particulier').count()
        ano = prospect.query.filter_by(anom=True).count()
        return render_template('manage/pages/prospect.html',ano=ano,prospro=prospro,prospart=prospart,Client=zip(client_,history),legend="client", highlight='prospect')

    
    return redirect(url_for('users.main'))

@users.route('/ajouter/prospect',methods=['GET','POST'])
@login_required
def ajouter_prospect():
    if current_user.TYPE == "Admin":
        form=Client_Form()
        if form.validate_on_submit():
            user=prospect(TYPE=form.Type.data,societe=form.Societe.data,titre=form.Sexe.data,nom=form.NOM.data,email=form.email.data,numero=form.Numero.data)
            db.session.add(user)
            db.session.commit()
            tous=[]
            alll=list(prospect.query.all())
            for i in alll:
                tous.append(i.reference)
            user.reference =generate(tous)
            db.session.commit()
            user_history=prospect.query.filter(and_(prospect.email==form.email.data,prospect.nom==form.NOM.data)).first()
            user_history.siret=form.Siret.data
            db.session.commit()
            client_history=prospect_History(prospect=user_history.id,adresse1=form.Adresse1.data,adresse2=form.Adresse2.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(client_history)
            db.session.commit()
            client_history.etat_client = form.EtatClient.data
            client_history.mpd_extranet =form.MdpExtranet.data
            client_history.login_extranet=form.LoginExtranet.data
            db.session.commit()
            flash(f'Prospect créé avec succès','success')
            return redirect(url_for('users.show_prospect',id=user.id))
        print("didn't validate on submit")    
        return render_template('manage/pages/ajouter_client.html',form=form,legend="prospect", highlight='prospect')
    else:
        return redirect(url_for('users.main'))

'''@users.route('/mes_factures', methods=['GET'])
@login_required
def mes_factures():
    return render_template('manage/pages/mes_factures.html',legend="mes facture", highlight='mes_factures')'''

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
        flash(f'Les données du Prospect ont été supprimées','success')
        return redirect(url_for('users.prospect_'))



@users.route('/show/<int:id>/prospect', methods=['GET'])
@login_required
def show_prospect(id):
    if current_user.TYPE == "Admin":
        client = prospect.query.filter_by(id=id).first_or_404()
        client_history=prospect_History.query.filter_by(prospect=id).order_by(asc(prospect_History.date)).first_or_404()
        return render_template('manage/pages/show_client.html', highlight='prospect', client=client,history=client_history,legend='prospect')


@users.route('/edit/<int:id>/prospect', methods=['GET','POST'])
@login_required
def edit_prospect(id):
    if current_user.TYPE == "Admin":
        client = prospect.query.filter_by(id=id).first_or_404()
        form = Client_edit()
        form.client_id.data=id
        
        if form.validate_on_submit():
            f=form.validate3(form.email.data,form.client_id.data)
            if f==True:
                flash(f"l'email est Deja pris",'Warning')
                return redirect(url_for('users.edit_prospect', id=client.id))
            
            if client.id==int(form.client_id.data):
            
                client_history=prospect_History.query.filter_by(prospect=id).first()
                
                
                client_history.ville = form.Ville.data
                client_history.pays = form.Pays.data
                client_history.cp = form.CP.data
                client_history.adresse1 = form.Adresse1.data
                client_history.adresse2 = form.Adresse2.data
                client_history.login_extranet =form.LoginExtranet.data# add this and 2  to client
                client_history.mpd_extranet = form.MdpExtranet.data
                client_history.etat_client = form.EtatClient.data
                db.session.commit()
                client.reference=form.Reference.data
                client.email = form.email.data
                client.siret = form.Siret.data
                client.societe = form.Societe.data
                client.numero = form.Numero.data#do validation error for numbers
                client.titre = form.Sexe.data
                client.TYPE = form.Type.data
                client.enseigne =form.Enseigne.data
                client.nom = form.nom.data
                client.prenom= form.prenom.data
                db.session.commit()
                flash(f'Informations Prospect modifiées','success')
                return redirect(url_for('users.show_prospect',id=id))
        client_history=prospect_History.query.filter_by(prospect=id).order_by(asc(prospect_History.date)).first_or_404()
        return render_template('manage/pages/edit_prospect.html',highlight='prospect', client=client,history=client_history,form=form)






@users.route('/suivi/<int:id>/prospect')
@login_required
def suivi_prospect_(id):
    if current_user.TYPE == "Admin":
        suivi_=list(suivi_prospect.query.filter(and_(suivi_prospect.prospect_id==id,suivi_prospect.visibility==True)).all()) 
        pros=prospect.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/suivi_c.html',Suivi=suivi_,ID=id,legend="prospect",highlight='client',cli=pros)

    return redirect(url_for('users.main'))

@users.route('/ajouter/<int:id>/suivi_propect',methods=['GET','POST'])
@login_required
def ajouter_suivip(id):
    if current_user.TYPE == "Admin":
        form=Suivi_Client() 
        client = prospect.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            email = Expert.query.filter(and_(Expert.trigramme==form.expert.data,Expert.trigramme!='')).first()  #.lower()
            suivi=suivi_prospect(client.id,email.id,form.commentaire.data)
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

@users.route('/edit/<int:id>/suivi_propect', methods=['GET','POST'])
@login_required
def edit_suivip(id):
    if current_user.TYPE == "Admin":
        form = Suivi_Client()       
        suivi = suivi_prospect.query.filter_by(id=id).first_or_404()
        ex=Expert.query.filter_by(id=suivi.responsable).first()
        #if current_user.id == suivi.responsable:
        if form.validate_on_submit():
            email = Expert.query.filter(and_(Expert.trigramme==form.expert.data,Expert.trigramme!='')).first()#.lower()
            suivi.commentaire =form.commentaire.data
            suivi.responsable =email.id
            db.session.commit()
            flash(f'Le suivi a été modifiées','success')
            return redirect(url_for('users.suivi_prospect_',id=suivi.prospect_id))

        return render_template('manage/pages/edit_suivi_p.html',ex=ex, suivi=suivi,highlight='prospect',form=form)
        #else:
           # flash(f'Vous ne pouvez pas modifier ce suivi','warning')
           # return redirect(url_for('users.suivi_prospect_', id=id))
    return redirect(url_for('users.client'))





@users.route("/exporter", methods=['GET','POST'])
@login_required
def export():
    return render_template('manage/pages/exporter.html')

@users.route("/televeser", methods=['GET','POST'])
#@login_required
def up():
    db.create_all()
    
    '''db.create_all()
    expert1=Expert(genre='0',nom='',numero=0,TYPE='0', email='0' )
    expert=Expert(genre='Mr.',nom='Admin',numero=12345,TYPE='Admin', email='test0001@gmail.com' )
    db.session.add(expert1)
    db.session.add(expert)
    db.session.commit()
    expert1.id =0
    expert1.visibility =False
    expert.visibility =False
    hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    expert.password=hashed_password
    db.session.commit()'''
    #expert=Expert('M','Admin','Admin','test0001@gmail.com','1234567')
    #db.session.add(expert)
    #db.session.commit()'''
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
#@login_required
def uploader_():
    #if current_user.TYPE == 'Admin':
      # get the uploaded file
      if request.method == 'POST':
        uploaded_file = request.files['file']
        table = request.form['table']
        if uploaded_file.filename != '':
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], uploaded_file.filename)
            loc=str(file_path)
            # set the file path
            uploaded_file.save(file_path)
            if table == 'client':
                    lienta(loc)
                    '''if lient(loc) == False:
                        flash(f"Verifier la structure de votre fichier svp",'warning')
                        return redirect(url_for('users.up'))
                    #flash(f"Vous avez importer les donnees avec success",'success')
                    if lient(loc) == True:
                        flash(f"Vos données ont été importées avec succès",'success')
                        return redirect(url_for('users.up'))
                    if lient(loc) == 'Fake':
                        flash(f"Assurez-vous que le type de fichier est xlsx/xlsm/xltx/xltm pour permettre une importation rapide.",'warning')
                        return redirect(url_for('users.up'))
                    return lient(loc)'''
                    #return redirect(url_for('users.client'))

            
            if table == 'suivi':
                    suiv(loc)
                    '''if suiv(loc) == False:
                        flash(f"Verifier la structure de votre fichier svp",'warning')
                        return redirect(url_for('users.up'))
                    if suiv(loc) == 'Fake':
                        flash(f"Assurez-vous que le type de fichier est xlsx/xlsm/xltx/xltm pour permettre une importation rapide.",'warning')
                        return redirect(url_for('users.up'))
                    flash(f"Vos données ont été importées avec succès",'success')
                    return redirect(url_for('users.up'))'''
                    #return suiv(loc)
                
            if table == 'expert':
                    xperte(loc)
                    '''if xpert(loc) == False:
                        flash(f"Verifier la structure de votre fichier svp",'warning')
                        return redirect(url_for('users.up'))
                    if xpert(loc) == True:
                        flash(f"Vos données ont été importées avec succès",'success')
                        return redirect(url_for('users.up'))
                    if xpert(loc) == 'Fake':
                        flash(f"Assurez-vous que le type de fichier est xlsx/xlsm/xltx/xltm pour permettre une importation rapide.",'warning')
                        return redirect(url_for('users.up'))
                    return xpert(loc)'''
               
            if table == 'TarifC':
                
                arif(loc)
                '''if arif(loc) == False:
                    flash(f"Verifier la structure de votre fichier svp",'warning')
                    return redirect(url_for('users.up'))
                if arif(loc) == True:
                        flash(f"Vos données ont été importées avec succès",'success')
                        return redirect(url_for('users.up'))
                return arif(loc)'''
                
            if table == 'mission':
                #Base(loc)
                #Missions2(loc,'26')
                #Missions2(loc,'27')
                #Missions2(loc,'28')
                #Missions2(loc,'29')
                #Missions2(loc,'31')
                
                Missions(loc)
                '''if Missions1(loc) == False:
                        flash(f"Verifier la structure de votre fichier svp",'warning')
                        return redirect(url_for('users.up'))
                if Missions1(loc) == True:
                        flash(f"Vos données ont été importées avec succès",'success')
                        return redirect(url_for('users.up'))
                if Missions1(loc) == 'Fake':
                        flash(f"Assurez-vous que le type de fichier est .XLS pour permettre une importation rapide.",'warning')
                        return redirect(url_for('users.up'))
                return Missions1(loc)'''
                
               
            # save the file1362
            #expert__(loc)
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

            
            
            
        return redirect(url_for('users.main'))
    #return redirect(url_for('users.login'))


@users.route('/profil' , methods=['GET','POST'])
@login_required
def profil():
    if current_user:
        form = RegistrationForm1()
       
        client=Expert.query.filter_by(id=current_user.id).first()
        if form.validate_on_submit():
            f=form.validate2(form.email.data,current_user.id)
            if f==True:
                flash(f"l'email est déja prise",'warning')
                return redirect(url_for('users.profil'))
            client.nom=form.nom.data
            # ajout prenom
            client.prenom=form.prenom.data
            client.email=form.email.data
            client.login=form.login.data
            db.session.commit()
            #flash(f"Vous avez modifier avec success",'success')
            return redirect(url_for('users.main'))
    return render_template('manage/pages/profile.html',form=form,client=client)

@users.route('/<int:id>/profil' , methods=['GET','POST'])
@login_required
def addlogin(id):
    if current_user:
        form = RegistrationForm1()
        client=Expert.query.filter_by(id=id).first()
        if form.validate_on_submit():
            f=form.validate2(form.email.data,id)
            if f==True:
                flash(f"l'email est déja prise",'warning')
                return redirect(url_for('users.addlogin',id=id))
            client.nom =form.username.data
            client.email=form.email.data
            client.login=form.login.data
            db.session.commit()
            #flash(f"Vous avez modifier avec success",'success')
            return redirect(url_for('users.show_expert',id=id))
    return render_template('manage/pages/add_login.html',form=form,client=client)

'''@users.app_errorhandler(404)
def error_404(error):
    return render_template('errors/404.html'),404''' 

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
            clients = Client.query.filter(and_(or_(Client.nom.contains(str(search)),Client.prenom.contains(str(search)),Client.email.contains(str(search)),Client.numero.contains(str(search)),Client.societe.contains(str(search))),Client.visibility==True)).all()
            if len(clients) > 1:
                title = "Clients"
            else:
                title = "Client"
            return render_template('manage/pages/search_results.html', clients=clients, title=title, highlight='client',table=table, search=request.args.get('keyword'))
        if table == 'prospect':
            prospects = prospect.query.filter(and_(or_(prospect.nom.contains(str(search)),prospect.prenom.contains(str(search)),prospect.email.contains(str(search)),prospect.numero.contains(str(search)),prospect.societe.contains(str(search))),prospect.visibility==True)).all()
            if len(prospects) > 1:
                title = "Prospects"
            else:
                title = "Prospect"
            return render_template('manage/pages/search_results.html', prospects=prospects, highlight='prospect',title=title, table=table, search=request.args.get('keyword'))
        elif table == 'tarif':
            tarifs = Tarifs.query.filter(and_(or_(Tarifs.reference_client.like(search),Tarifs.type_maison.like(search),Tarifs.Prix.like(search),Tarifs.remise.like(search)),Tarifs.visibility==False)).all()#fix reference du client eeh
            if len(tarifs) > 1:
                title = "Tarifs"
            else:
                title = "Tarif"
            return render_template('manage/pages/search_results.html', tarifs=tarifs, highlight='tarif_base', title=title, table=table, search=request.args.get('keyword'))
        elif table == 'expert':
            try :
                if isinstance(int(key),int) == True:
                    experts = Expert.query.filter(and_(or_(Expert.nom.contains(search),Expert.prenom.contains(str(search)),Expert.email.contains(search),Expert.TYPE.contains(search),Expert.numero.like(search)),Expert.visibility==True)).all()
            except: 
                experts = Expert.query.filter(and_(or_(Expert.nom.contains(search),Expert.prenom.contains(str(search)),Expert.email.contains(search),Expert.TYPE.contains(search)),Expert.visibility==True)).all()
            if len(experts) > 1:
                title = "Experts"
            else:
                title = "Expert"
            return render_template('manage/pages/search_results.html', experts=experts, highlight='expert', title=title, table=table, search=request.args.get('keyword'))
        elif table == 'mission':
            experts = Expert.query.filter(Expert.nom.contains(str(search))).first()   
            clients = Client.query.filter(Client.nom.contains(str(search))).first()
            if  clients:
                missions = Mission.query.filter(and_(Mission.Reference_BAILLEUR==clients.id,Mission.Visibility==True)).all()
            if  experts:
                missions = Mission.query.filter(and_(or_(Mission.ID_INTERV==experts.id,Mission.ID_manager_chiffrage==experts.id,Mission.ID_agent_chiffrage==experts.id
                ,Mission.ID_Respon_Cell_Dev==experts.id,Mission.ID_agent_Cell_Dev==experts.id,Mission.ID_Agent_CellTech==experts.id
                ,Mission.ID_Respon_Cell_Tech==experts.id,Mission.ID_Suiveur_Cell_Tech==experts.id,Mission.ID_Respon_Cell_Planif==experts.id
                ,Mission.ID_Suiveur_Cell_Planif ==experts.id,Mission.ID_Agent_saisie_Cell_Planif==experts.id),Mission.Visibility==True)).all()
            else:
                missions=[]
            if len(missions) > 1:
                title = "Missions"
            else:
                title = "Mission"
            return render_template('manage/pages/search_results.html', missions=missions, highlight='mission', title=title, table=table, search=request.args.get('keyword')) 
        





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
                         mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=start,Mission.DATE_REALISE_EDL<=end,Mission.NRO_FACTURE=='')).order_by(asc(Mission.id)).all())#check query
            if mission_ == client:
                flash(f'cette date a deja ete facture','success')
                return redirect(url_for('users.choosev',Type='month'))
            try:
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
                            if mission.TYPE_LOGEMENT == None:
                                mission.TYPE_LOGEMENT = ''
                                db.session.commit()
                            if mission.CODE_FACTURATION == None:
                                mission.CODE_FACTURATION = ''
                                db.session.commit()
                            if mission.CODE_FACTURATION is None:

                                flash(f'SVP Generez une code  Facturation pour cette mission','success')
                                return redirect(url_for('users.show_mission',id=mission.id))

                            else:
                                
                                if mission.CODE_FACTURATION[0:2] == 'TS':
                                    price[i].append(mission.CODE_FACTURATION[3:-1])
                                if mission.CODE_FACTURATION[0:2] == 'TN':

                                    if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == 'U' :
                                        
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                                meuble=float(tarif.edl_prix_std)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_prix_std) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                                
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_prix_std
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    
                                    if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '1' :
                                        
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                                meuble=float(tarif.edl_appt_prix_f1)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f1) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                                
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f1
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '2':
                                        #print('APPT 2')
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                                meuble=float(tarif.edl_appt_prix_f2)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f2) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f2
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '3':
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                                meuble=float(tarif.edl_appt_prix_f3)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f3) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f3
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '4':
                                        
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                                meuble=float(tarif.edl_appt_prix_f4)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f4) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f4
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '5':
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                                meuble=float(tarif.edl_appt_prix_f5)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f5) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f5
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '6':
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                                meuble=float(tarif.edl_appt_prix_f6)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f6) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f6
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '7':
                                        tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':#check print
                                                meuble=float(tarif.EDL_APPT_prix_F7)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f7) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_appt_prix_f7
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))

                                    if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '1' :
                                        tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':
                                                meuble=float(tarif.edl_pav_villa_prix_t1)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t1) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t1
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '2' :
                                        
                                        tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':
                                                meuble=float(tarif.edl_pav_villa_prix_t2)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t2) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t2
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '3' :
                                        tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':
                                                meuble=float(tarif.edl_pav_villa_prix_t3)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t3) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t3
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                
                                    if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '4' :
                                        
                                        tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':
                                                meuble=float(tarif.edl_pav_villa_prix_t4)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t4) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t4
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '5' :
                                        tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':
                                                meuble=float(tarif.edl_pav_villa_prix_t5)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t5) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t5
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))
                                    if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '6' :
                                        tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':
                                                meuble=float(tarif.edl_pav_villa_prix_t6)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t6) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t6
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))#goes up to 8  '''
                                    if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '7' :
                                        tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':
                                                meuble=float(tarif.edl_pav_villa_prix_t7)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t7) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t7
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))#goes up to 8  '''
                                    if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '8' :
                                        tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                        if tarif !=None:
                                            if mission.CODE_FACTURATION[2:5] == '150':
                                                meuble=float(tarif.edl_pav_villa_prix_t8)/2
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t8) + float(meuble)
                                                    db.session.commit()
                                                #price[i].append(float(mission.PRIX_HT_EDL))
                                            else:
                                                if mission.PRIX_HT_EDL==0.00:
                                                    mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t8
                                                    db.session.commit()
                                        price[i].append(float(mission.PRIX_HT_EDL))#goes up to 8  '''
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = 0
                                            db.session.commit()
                                        else:
                                            price[i].append(float(mission.PRIX_HT_EDL))
                                else:
                                    if mission.PRIX_HT_EDL==0.00:
                                        mission.PRIX_HT_EDL = 0
                                        db.session.commit()
                                    else:
                                        price[i].append(float(mission.PRIX_HT_EDL))
            except:      
                flash(f"Veuillez vérifier le tarif du client, assurez-vous qu'il est correct",'warning')
                return redirect(url_for('users.choosev',Type='month'))

            for i in price:
                a=sum(price[i])
                price[i]=a
                
                
                
            return render_template('manage/pages/ajouter_facturationm.html',form=form2,highlight='mission',sum=price,start=start,end=end)

        if Type == "month":
                    return render_template('manage/pages/choose.html',form=form,highlight='mission',legend="time")
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
        _mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.NRO_FACTURE=='',Mission.Visibility==True,Mission.coherent==False)).order_by(desc(Mission.id)).all())
        mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.NRO_FACTURE=='',Mission.Visibility==True,Mission.coherent==True)).order_by(desc(Mission.id)).all())#check query
        
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
                facture=facturation_client(Date_mission=request.form['Demarrer'],client=i)
                db.session.add(facture)
                db.session.commit()
                factura=str(facture.Date_de_creation)
                facture.n_facture=str(facture.id)+'-'+str(factura[2:4])+str(factura[5:7])+'-C'
                db.session.commit()
                for mission in relation[i]:
                    price.append(float(mission.PRIX_HT_EDL))
                    mission.NRO_FACTURE = facture.n_facture
                    mission.appli=True
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
            flash(f'Erreur de Codification Aucune facture générée','warning')
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
        mission=Mission.query.filter_by(id=a[0]).first()
        pid=mission.Reference_BAILLEUR
        try:
            for i in a:
                mission=Mission.query.filter(and_(Mission.id==int(i),Mission.NRO_FACTURE=='',Mission.Visibility==True)).first()
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
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == 'U' :
                                tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                        meuble=float(tarif.edl_prix_std)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_prix_std) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                        
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_prix_std
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '1'   :
                                
                                tarif=Tarifs.query.filter_by(reference_client = mission.Reference_BAILLEUR).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print# fix
                                        if mission.PRIX_HT_EDL==0.00:
                                            meuble=float(tarif.edl_appt_prix_f1)/2
                                            mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f1) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                        
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_appt_prix_f1
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '2':
                                #print('APPT 2')
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f2)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f2) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_appt_prix_f2
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '3':
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f3)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f3) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_appt_prix_f3
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '4':
                                
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f4)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f4) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_appt_prix_f4
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '5':
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f5)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f5) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_appt_prix_f5
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '6':
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.edl_appt_prix_f6)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f6) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_appt_prix_f6
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:4] == 'APPT' and mission.TYPE_LOGEMENT[-1] == '7':
                                tarif=Tarifs.query.filter_by(reference_client = mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':#check print
                                        meuble=float(tarif.EDL_APPT_prix_F7)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_appt_prix_f7) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_appt_prix_f7
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))

                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '1' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t1)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t1) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t1
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '2' :
                                
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t2)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t2) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t2
                                            db.session.commit()
                                price.append(float(tarif.edl_pav_villa_prix_t2))
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '3' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t3)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t3) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t3
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                        
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '4' :
                                
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t4)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t4) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t4
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '5' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t5)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t5) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t5
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '6' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t6)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t6) + float(meuble)
                                            db.session.commit() 
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t6
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))#goes up to 8  '''
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '7' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t7)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t7) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t7
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))#goes up to 8  '''
                            if mission.TYPE_LOGEMENT[0:3] == 'PAV' and mission.TYPE_LOGEMENT[-1] == '8' :
                                tarif=Tarifs.query.filter_by(reference_client=mission.Bailleur__data.id).first()
                                if tarif !=None:
                                    if mission.CODE_FACTURATION[2:5] == '150':
                                        meuble=float(tarif.edl_pav_villa_prix_t8)/2
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = float(tarif.edl_pav_villa_prix_t8) + float(meuble)
                                            db.session.commit()
                                        #price.append(float(mission.PRIX_HT_EDL))
                                    else:
                                        if mission.PRIX_HT_EDL==0.00:
                                            mission.PRIX_HT_EDL = tarif.edl_pav_villa_prix_t8
                                            db.session.commit()
                                price.append(float(mission.PRIX_HT_EDL))#goes up to 8  '''
                            else:
                                    if mission.PRIX_HT_EDL==0.00:
                                        mission.PRIX_HT_EDL = 0
                                        db.session.commit()
                                    else:
                                        price[i].append(float(mission.PRIX_HT_EDL))
                        else:
                            if mission.PRIX_HT_EDL==0.00:
                                mission.PRIX_HT_EDL = 0
                                db.session.commit()
                            else:
                                price[i].append(float(mission.PRIX_HT_EDL))
        except:
            flash(f"Veuillez vérifier le tarif du client, assurez-vous qu'il est correct",'warning')
            mission_=list(Mission.query.filter(and_(Mission.Visibility==True,Mission.Reference_BAILLEUR==pid,Mission.NRO_FACTURE=='')).order_by(desc(Mission.id)).all())
            client = Client.query.filter_by(id=pid).first()
            return render_template('manage/pages/client_mission.html',client=client,missions=mission_,legend="mission", highlight='mission')

        p=sum(price)
        form.Missions.data=m
        return render_template('manage/pages/ajouter_facturtionp.html', highlight='mission', mission=m,form=form,sum=p,name=v)


    return redirect(url_for('users.main'))


@users.route('/compte_mensuel_facturation_expert', methods=['GET', 'POST'])
@login_required
def compte_mensuel_facturation_expert():
    form=time()
    #form2=Facturation_Form()
    return render_template('manage/pages/ajouter_facturation_expert.html', form=form,legend="time", highlight='expert')

@users.route('/facturation_experts_generees', methods=['GET', 'POST'])
@login_required
def facturation_experts_generees():
    #form2=Facturation_Form()
    return render_template('manage/pages/factures_generer.html', highlight='expert')

@users.route('/facturation_expert_mission', methods=['GET', 'POST'])
@login_required
def facturation_expert_mission():
    #form2=Facturation_Form()
    return render_template('manage/pages/facture_missions.html', highlight='expert')


@users.route('/facturation_expert_relever', methods=['GET', 'POST'])
@login_required
def facturation_relever():
    #form2=Facturation_Form()
    return render_template('manage/pages/facture_missions.html', highlight='expert')




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
                mission=Mission.query.filter(and_(Mission.id==int(i),Mission.NRO_FACTURE=='',Mission.Visibility==True)).first()
                missions.append(mission)

            facture=facturation_client(Montant_HT=request.form['Montant_HT'],Statut='attente',client=request.form['Reference_client'])
            db.session.add(facture)
            db.session.commit()
            factura=str(facture.Date_de_creation)
            facture.n_facture=str(facture.id)+'-'+str(factura[2:4])+str(factura[5:7])+'-C'
            db.session.commit() 

            for i in missions:
                i.NRO_FACTURE = facture.n_facture
                i.appli=True
                i.DATE_FACTURE = facture.Date_de_creation
                fact_m=facturation_mission(ref_mission=i.id,fact_mission=facture.id)
                db.session.add(fact_m)
                db.session.commit()

            return redirect(url_for('users.facturation',id=request.form['Reference_client']))
        else:
            flash(f'Erreur de Codification','warning')
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


@users.route('/choose/date/mensuel',methods=['GET','POST'])
@login_required
def chooseef():
    if current_user.TYPE == "Admin":
        form=time()
        form2=Facturationex_Form()
        
        if form.validate_on_submit():  
            start=datetime.combine(form.Demarrer.data,datetime.min.time())
            end=datetime.combine(start+timedelta(days=30),datetime.min.time())
            
            price=list()
            
            mission_=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=start,Mission.Visibility==True,Mission.PRIX_HT_EDL!=0.00,Mission.DATE_REALISE_EDL<=end,Mission.Facex==False)).order_by(asc(Mission.id)).all())#check query
            if mission_ != price:
                for i in mission_:
                    price.append(i.PRIX_HT_EDL)
                total=sum(price)
            #fix lower page
                return render_template('manage/pages/detail_facturatione.html', mission=mission_,highlight='mission',form=form2,sum=total,start=start,end=end)
            else:
                flash(f'Cette facture a déjà été générée','Warning')
                return redirect(url_for('users.chooseef'))
            
            
        return render_template('manage/pages/ajouter_facturation_expert.html',highlight='expert',form=form,legend="time")


@users.route('/indi/fact/client',methods=['GET','POST'])
@login_required
def chooseindc():
    if current_user.TYPE == "Admin":
        form=mission_id()
        form2=Facturationind_Form()
        if form.validate_on_submit(): 
            mission=Mission.query.filter(and_(Mission.id==form.ID.data,Mission.Facex==False,Mission.Visibility==True)).first()
            if mission != None:
                return render_template('manage/pages/detail_facturationc.html', key=mission,highlight='mission',form=form2)

            else:
                flash(f'Cette facture a déjà été générée','Warning')
                return redirect(url_for('users.chooseindc'))
        
        return render_template('manage/pages/ajouter_facturation_client_indi.html',highlight='expert',form=form,legend="time")


@users.route('/create_factur/indi/',methods=['GET','POST'])
@login_required
def create_facturi():
    if current_user.TYPE == "Admin": 
        misall=facturation_client.query.order_by(desc(facturation_client.id)).first()
        miss=Mission.query.filter_by(id=request.form['Mission']).first()
        fact=facturation_client(Montant_HT=request.form['Montant_HT'],client=miss.Reference_BAILLEUR,Date_mission=miss.DATE_REALISE_EDL)
        db.session.add(fact)
        db.session.commit()
        n_facture=int(misall.id)+1
        fact.n_facture=n_facture
        db.session.commit()
        fact_m=facturation_mission(ref_mission=miss.id,fact_mission=fact.id)
        db.session.add(fact_m)
        db.session.commit()
        return redirect(url_for('users.facturationa'))
  
@users.route('/create_facturee/',methods=['GET','POST'])
@login_required
def create_facturee():
    if current_user.TYPE == "Admin":
        form=Facturationex_Form()
        #def ex(id):
        #rint(request)
        
        #_mission=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.PRIX_HT_EDL==0.00,Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.Visibility==True,Mission.Facex ==False)).order_by(desc(Mission.id)).all())
        mission=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=request.form['Demarrer'],Mission.PRIX_HT_EDL!=0.00,Mission.DATE_REALISE_EDL<=request.form['Fin'],Mission.Visibility==True,Mission.Facex ==False)).order_by(desc(Mission.id)).all())
        #option for prix ht_edl = None
        '''ty={1:'RIAS sans abonnement (PMFACT)',2:'RIAS avec abonnement (PMFACT)',3:'AC Missions réalisées',4:'TS Technicien contrôleur-suiveur',5:'TM Technicien manager',
                6:'TA Technicien agent',7:'SM Sales manager',8:'SA Sales agent suiveur client',
                9:'PLANSUIV Suivi RDV',10:'PLANSAISIE Suivi agenda',11:'PLANRESP Responsable planning'
                ,12:'Chiffrage Agent réalisateur',13:'Chiffrage AS',14:'Chiffrage responsable'}
        p=[15,15,40,3,1,1,1,4,2,2,1,40,25,5]
        for i,j in zip(ty,p):
           exee=Type_expert(type_ex=ty[i],pourcentage=j/100,type_releve=i)
           db.session.add(exee)
           db.session.commit()'''
        
        for i in mission:
            #implement facture number
            i.Facex =True
            db.session.commit()
            Type=Type_expert.query.filter_by(id=3).first()
            ex=Expert.query.filter_by(id=i.ID_INTERV).first()
            tot=list()
            Rel=list()
            if i.DATE_FACT_REGLEE != None:
                mensuel=compte_mensuel(mission=i.id,intervenant=ex.nom,date_cmpte_mensuel=request.form['Fin'],prix_mission=i.PRIX_HT_EDL,etat=True,commission_ac=Type.pourcentage*i.PRIX_HT_EDL)
                db.session.add(mensuel)
                db.session.commit()
            else:
                mensuel=compte_mensuel(mission=i.id,intervenant=ex.nom,date_cmpte_mensuel=request.form['Fin'],prix_mission=i.PRIX_HT_EDL,etat=False,commission_ac=Type.pourcentage*i.PRIX_HT_EDL)
                db.session.add(mensuel)
                db.session.commit()

            hta={1:i.ID_AS,2:i.ID_AS,3:i.ID_INTERV,4:i.ID_Suiveur_Cell_Tech,5:i.ID_Agent_CellTech,
                6:i.ID_Respon_Cell_Tech,7:i.ID_Respon_Cell_Dev,8:i.ID_agent_Cell_Dev,
                9:i.ID_Suiveur_Cell_Planif,10:i.ID_Agent_saisie_Cell_Planif,11:i.ID_Respon_Cell_Planif}

            chiffa={12:i.ID_agent_chiffrage,13:i.ID_AS,14:i.ID_manager_chiffrage}
            
            for R in hta:
                ex=Expert.query.filter_by(id=hta[R]).first()
                Type=Type_expert.query.filter_by(id=R).first()
                expert=expert_facturation(mission=mensuel.id,expert_id=hta[R],type_expert=Type.id,commision=i.PRIX_HT_EDL*Type.pourcentage)
                db.session.add(expert)
                db.session.commit()
                date=str(mensuel.date_cmpte_mensuel)
                date1=date[0:10]
                spli=date1.split("-")
                fac=''.join(spli)
                expert.facture =fac+"-"+str(ex.trigramme)+"-"+str(Type.id)
                db.session.commit()
                if mensuel.etat == True:
                    tot.append(expert.commision)
                else:
                    Rel.append(expert.commision)
            for R in chiffa:
                ex=Expert.query.filter_by(id=chiffa[R]).first()
                Type=Type_expert.query.filter_by(id=R).first()
                expert=expert_facturation(mission=mensuel.id,expert_id=chiffa[R],type_expert=Type.id,commision=i.Prix_ht_chiffrage*Type.pourcentage)
                db.session.add(expert)
                db.session.commit()
                date=str(mensuel.date_cmpte_mensuel)
                date1=date[0:10]
                spli=date1.split("-")
                fac=''.join(spli)
                expert.facture =fac+"-"+str(ex.trigramme)+"-"+str(Type.id)
                db.session.commit()
                if mensuel.etat == True:
                    tot.append(expert.commision)
                else:
                    Rel.append(expert.commision)
            mensuel.total=sum(tot)
            mensuel.releve=sum(Rel)
            db.session.commit()
        '''for i in _mission:
            #implement facture number
            i.Facex =True
            db.session.commit()
            ex=Expert.query.filter_by(id=i.ID_INTERV).first()
            if i.DATE_FACT_REGLEE != None:
                mensuel=compte_mensuel(mission=i.id,intervenant=ex.nom,date_cmpte_mensuel=request.form['Fin'],anomalie=True,etat=True)
                db.session.add(mensuel)
                db.session.commit()
            else:
                mensuel=compte_mensuel(mission=i.id,intervenant=ex.nom,date_cmpte_mensuel=request.form['Fin'],anomalie=True,etat=False)
                db.session.add(mensuel)
                db.session.commit()

            hta={1:i.ID_AS,2:i.ID_AS,3:i.ID_INTERV,4:i.ID_Suiveur_Cell_Tech,5:i.ID_Agent_CellTech,
                6:i.ID_Respon_Cell_Tech,7:i.ID_Respon_Cell_Dev,8:i.ID_agent_Cell_Dev,
                9:i.ID_Suiveur_Cell_Planif,10:i.ID_Agent_saisie_Cell_Planif,11:i.ID_Respon_Cell_Planif}

            chiffa={12:i.ID_agent_chiffrage,13:i.ID_AS,14:i.ID_manager_chiffrage}

            for R in hta:
                ex=Expert.query.filter_by(id=hta[R]).first()
                Type=Type_expert.query.filter_by(id=R).first()
                expert=expert_facturation(mission=mensuel.id,expert_id=hta[R],type_expert=Type.id)
                db.session.add(expert)
                db.session.commit()
                date=str(mensuel.date_cmpte_mensuel)
                date1=date[0:10]
                spli=date1.split("-")
                fac=''.join(spli)
                expert.facture =fac+"-"+str(ex.trigramme)+"-"+str(Type.id)
                db.session.commit()
            for R in chiffa:
                ex=Expert.query.filter_by(id=chiffa[R]).first()
                Type=Type_expert.query.filter_by(id=R).first()
                expert=expert_facturation(mission=mensuel.id,expert_id=chiffa[R],type_expert=Type.id)
                db.session.add(expert)
                db.session.commit()
                date=str(mensuel.date_cmpte_mensuel)
                date1=date[0:10]
                spli=date1.split("-")
                fac=''.join(spli)
                expert.facture =fac+"-"+str(ex.trigramme)+"-"+str(Type.id)
                db.session.commit()'''
            #implement total for the missions,where type releve1 not equal to 3
        return redirect(url_for('users.allex'))
    return redirect(url_for('users.main'))

@users.route('/tous/facturation/mensuel',methods=['GET','POST'])
@login_required
def allex():
    if current_user.TYPE == "Admin":
           facture=compte_mensuel.query.all() 
           gene=compte_mensuel.query.filter(compte_mensuel.date_generation!=None).count()
           ngene=compte_mensuel.query.filter(compte_mensuel.date_generation==None).count()
           return render_template('manage/pages/factures_generer.html',facture=facture,highlight='mission',gene=gene,ngene=ngene)

    return redirect(url_for('users.main'))

@users.route('/tous/mission/<int:id>/expert',methods=['GET','POST'])
@login_required
def factme(id):
    if current_user.TYPE == "Admin":
           facture=expert_facturation.query.filter_by(mission=id).all() 
           miss=facture[0].mission__data.mission
           return render_template('manage/pages/facture_missions.html',highlight='mission',facture=facture,id=id,miss=miss)

    return redirect(url_for('users.main'))

@users.route('/choose/<int:id>/date/generation',methods=['GET','POST'])
@login_required
def choosedg(id):
    if current_user.TYPE == "Admin":
        form=time()
        if form.validate_on_submit():  
            start=datetime.combine(form.Demarrer.data,datetime.min.time())
            facture=compte_mensuel.query.filter_by(id=id).first()
            
            facture.date_generation=start
            db.session.commit()
            flash(f'Date générée avec succès pour facture numero '+str(id),'success')
            return redirect(url_for('users.allex'))

        return render_template('manage/pages/choose.html',highlight='mission',form=form,legend="genere")

@users.route('/<int:id>/expert', methods=['GET', 'POST'])
@login_required
def mes_factures(id):
    mes=request.args.get('releve')
    temps=request.args.get('time')    
    nom=Expert.query.filter_by(id=id).first()
    releve=Type_expert.query.join(expert_facturation,(expert_facturation.type_expert == Type_expert.id)).filter(and_(expert_facturation.expert_id==id,expert_facturation.envoye==False)).all()
    rel=[]
    test=[]
    new_rel=[]
    for i in releve:
        test.append(i)
    for i in test:
        if i not in rel:
            rel.append(i)
    now_utc = datetime.now(timezone.utc)
    start=datetime.combine(now_utc,datetime.min.time())
    

    if  temps == "nouvelle":
        if mes == None:
            return render_template('manage/pages/mes_factures.html',nom=nom.nom, highlight='expert',rel=rel,new_rel=new_rel,id=id,temps=temps,mes=mes)
        new_rel=expert_facturation.query.filter(and_(expert_facturation.expert_id==id,expert_facturation.type_expert==int(mes),expert_facturation.envoye==False)).join(
                                        compte_mensuel,(compte_mensuel.id == expert_facturation.mission)).filter(
                                            compte_mensuel.date_generation>=start - timedelta(days=30)).all()
        
        return render_template('manage/pages/mes_factures.html',nom=nom.nom, highlight='expert',rel=rel,new_rel=new_rel,id=id,temps=temps,mes=mes)
    
    if  temps == "ancienne":
        if mes == None:
            return render_template('manage/pages/mes_factures.html',nom=nom.nom, highlight='expert',rel=rel,new_rel=new_rel,id=id,temps=temps,mes=mes)
        new_rel=expert_facturation.query.filter(and_(expert_facturation.expert_id==id,expert_facturation.type_expert==int(mes),expert_facturation.envoye==False)).join(
                                        compte_mensuel,(compte_mensuel.id == expert_facturation.mission)).filter(
                                            compte_mensuel.date_generation<start - timedelta(days=30)).all()
        return render_template('manage/pages/mes_factures.html',nom=nom.nom, highlight='expert',rel=rel,new_rel=new_rel,id=id,temps=temps,mes=mes)
    mes=None
    temps=None
    return render_template('manage/pages/mes_factures.html',nom=nom.nom, highlight='expert',rel=rel,new_rel=new_rel,id=id,temps=temps,mes=mes)


@users.route('/<mes>/<temps>/<id>/<save>/download')
@login_required
def download(mes,temps,id,save):
    if current_user: 
            name=Expert.query.filter_by(id=int(id)).first()
            histo=Expert_History.query.filter_by(id=int(id)).first()
            now_utc = datetime.now(timezone.utc)
            start=datetime.combine(now_utc,datetime.min.time())
            if  temps == "nouvelle":
                    new_rel=expert_facturation.query.filter(and_(expert_facturation.expert_id==id,expert_facturation.type_expert==int(mes),expert_facturation.envoye==False)).join(
                                                    compte_mensuel,(compte_mensuel.id == expert_facturation.mission)).filter(
                                                        compte_mensuel.date_generation>=start - timedelta(days=30)).all()
                    img=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'images','logo',"logo.png")
                    with open(img, 'rb') as image_file:
                         image= base64.b64encode(image_file.read()).decode()
                    su=list()
                    re=list()
                    for i in new_rel:
                        if i.mission__data.etat == True:
                            su.append(i.commision)
                        else:
                            re.append(i.commision)
                    fin=sum(su)
                    releve=sum(re)
                    if save =="false":
                        res=wkhtmltopdf.render_template_to_pdf('manage/pages/pdf.html', download=True, save=False,histo=histo, new_rel=new_rel,Nom=name,image=image,fin=fin,releve=releve)
                        return res
                    if save == "true":
                        res=wkhtmltopdf.render_template_to_pdf('manage/pages/pdf.html', download=True,histo=histo, save=True, new_rel=new_rel,Nom=name,image=image,fin=fin,releve=releve)
                        files=os.listdir(app.config['PDF_DIR_PATH'])
                        for fil in files:
        
                            if fil.endswith('.pdf'):
                                f=fil
                                break
                        nom=''.join(name.nom)
                        las=nom+'.pdf'
                        fil=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'pdf',f)
                        n=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'pdf',las)
                        os.rename(fil,n)
                        send_pdf("vincent@resilion.eu",name.nom,n)
                        os.remove(n)
                        for i in new_rel: 
                            if i.date_retrait_facture == None:
                                i.date_retrait_facture=datetime.combine(now_utc,datetime.min.time())
                                db.session.commit()
                        flash(f'Facture envoyée au centre de gestion','Success')
                        return redirect(url_for('users.mes_factures',id=id,releve=mes,time=temps))
            if  temps == "ancienne":

                    new_rel=expert_facturation.query.filter(and_(expert_facturation.expert_id==id,expert_facturation.type_expert==int(mes),expert_facturation.envoye==False)).join(
                                                compte_mensuel,(compte_mensuel.id == expert_facturation.mission)).filter(
                                                    compte_mensuel.date_generation<start - timedelta(days=30)).all()

                    img=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'images','logo',"logo.png")
                    with open(img, 'rb') as image_file:
                         image= base64.b64encode(image_file.read()).decode()
                    su=list()
                    re=list()
                    for i in new_rel:
                        if i.mission__data.etat == True:
                            su.append(i.commision)
                        else:
                            re.append(i.commision)
                    fin=sum(su)
                    releve=sum(re)
                    if save =="false":
                        res=wkhtmltopdf.render_template_to_pdf('manage/pages/pdf.html', download=True, save=False,histo=histo, new_rel=new_rel,Nom=name,image=image,fin=fin,releve=releve)
                        return res
                    if save == "true":
                        res=wkhtmltopdf.render_template_to_pdf('manage/pages/pdf.html', download=True,histo=histo, save=True, new_rel=new_rel,Nom=name,image=image,fin=fin,releve=releve)
                        files=os.listdir(app.config['PDF_DIR_PATH'])
                        for fil in files:
        
                            if fil.endswith('.pdf'):
                                f=fil
                                break
                        nom=''.join(name.nom)
                        las=nom+'.pdf'
                        fil=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'pdf',f)
                        n=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'pdf',las)
                        os.rename(fil,n)
                        send_pdf("vincent@resilion.eu",name.nom,n)
                        os.remove(n)
                        for i in new_rel:
                            if i.date_retrait_facture == None:
                                i.date_retrait_facture=datetime.combine(now_utc,datetime.min.time())
                                db.session.commit()
                        flash(f'Facture envoyée au centre de gestion','Success')
                        return redirect(url_for('users.mes_factures',id=id,releve=mes,time=temps))

    return redirect(url_for('users.main'))

@users.route('/fac/<int:id>/<save>/download',methods=['GET','POST'])
@login_required
def gestion(id,save):
    if current_user.TYPE == "Admin":
        abnormal =list()
        factura = list(facturation_mission.query.filter_by(fact_mission=id).all())
        print(factura)
        NRO=factura[0].facturation_client__data_.n_facture
        for i in factura:
            if i.mission__data_.Anomalie == True:
                abnormal.append(i)
        total=facturation_client.query.filter_by(id=id).first()
        s1=set(abnormal)
        s2=set(factura)
        facture = list(s2.difference(s1))
        name1=factura[0].facturation_client__data_.client__data_.id
        name=Client.query.filter_by(id=name1).first()
        his=Client_History.query.filter_by(id=name1).first()
        failed = list(Facturation_history.query.filter(and_(Facturation_history.facture==id,Facturation_history.visibility==True)).all())
        img=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'images','logo',"logo.png")
        with open(img, 'rb') as image_file:
                image= base64.b64encode(image_file.read()).decode()
        if failed:
            flash(f'Corigee vos factures incorrecte svp','Warning')
            return render_template('manage/pages/show_facture.html',gd=len(facture),abd=len(abnormal),fld=len(failed),nro=NRO,facture=facture,factura=factura,failed=failed,abnormal=abnormal,id=id)
        else:
            if save =="false":
                res=wkhtmltopdf.render_template_to_pdf('manage/pages/pdf1.html',his=his, download=True,total=total, save=False,nro=NRO,factura=factura,Nom=name,image=image)
                return res
            if save == "true":
                res=wkhtmltopdf.render_template_to_pdf('manage/pages/pdf1.html',his=his, download=True, total=total,save=True,nro=NRO, factura=factura,Nom=name,image=image)
                files=os.listdir(app.config['PDF_DIR_PATH'])
                for fil in files:
                    if fil.endswith('.pdf'):
                        f=fil
                        break
                
                nom=''.join(name.nom)
                las=nom+'.pdf'
                #try:
                fil=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'pdf',f)
                n=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'pdf',las)
                os.rename(fil,n)
                send_pdf("vincent@resilion.eu",name,n)
                os.remove(n)
                flash(f'Facture envoyée au centre de gestion','Success')
                return redirect(url_for('users.show_fac',id=id))

            #except:
            #   return redirect(url_for('users.main'))

#mission_datem=list(Mission.query.filter(extract('month', Mission.DATE_REALISE_EDL )==2020).all())
#mission_datey=list(Mission.query.filter(extract('year', Mission.DATE_REALISE_EDL )==2020).all())

@users.route('/exportm',methods=['GET','POST'])
@login_required
def exportm():
    if current_user.TYPE == "Admin":
            form=mission_export()
            now_utc = datetime.now(timezone.utc)
            start=datetime.combine(now_utc,datetime.min.time())
            if form.validate_on_submit():
                temp=app.config['MISS']
                mi=[]
                mi.append(temp)
                Typo = form.Temps.data
                date= form.Date.data
                if Typo =="Mois":
                    m=str(date)
                    month=int(m[5:7])
                    year=int(m[0:4])
                    miss=list(Mission.query.filter(and_(extract('month', Mission.DATE_REALISE_EDL )==month,extract('year', Mission.DATE_REALISE_EDL )==year)).all())
                if Typo == "Semaine":
                    start=datetime.combine(date,datetime.min.time())
                    end=datetime.combine(start+timedelta(days=6),datetime.min.time())
                    miss=list(Mission.query.filter(and_(Mission.DATE_REALISE_EDL>=start,Mission.DATE_REALISE_EDL<=end)).all())
                if Typo == "Jour":
                    da=datetime.combine(date,datetime.min.time())
                    miss=Mission.query.filter_by(DATE_REALISE_EDL=da).all()
                if miss != []:
                    mi=exo.mission_data(miss,mi)
                    name="missionex_"+gen_name()
                    return exo.export(mi,name)
                flash(f'Pas de Mission','Warning')
            
            return render_template('manage/pages/exportmission.html',form=form, highlight='mission')
    return redirect(url_for('users.main'))

@users.route('/export',methods=['GET','POST'])
@login_required
def exported():
    if current_user.TYPE == "Admin":
            Type = request.form['table']
            if Type =='expert':
               temp=app.config['EXPS']
               ex=[]
               ex.append(temp)
               exp=Expert.query.all()
               exp1=Expert_History.query.all()
               last=zip(exp,exp1)
               mi=exo.expert_data(last,ex)
               name="expertex_"+gen_name()
               return exo.export(mi,name)
            if Type == 'client':
               temp=app.config['CLI']
               ex=[]
               ex.append(temp)
               exp=Client.query.all()
               exp1=Client_History.query.all()
               last=zip(exp,exp1)
               mi=exo.client_data(last,ex)
               name="clientex_"+gen_name()
               return exo.export(mi,name)
            if Type == 'prospect':
               temp=app.config['CLI']
               ex=[]
               ex.append(temp)
               exp=Client.query.all()
               exp1=Client_History.query.all()
               last=zip(exp,exp1)
               mi=exo.prospect_data(last,ex)
               name="Prospectx_"+gen_name()
               return exo.export(mi,name)
            if Type == 'negociateur':
               temp=app.config['NEG']
               ex=[]
               ex.append(temp)
               exp=Client_negotiateur.query.all()
               exp1=Negotiateur_History.query.all()
               last=zip(exp,exp1)
               mi=exo.nego_data(last,ex)
               name="Negociateurx_"+gen_name()
               return exo.export(mi,name)
            if Type == 'suivic':
               temp=app.config['SUIV']
               ex=[]
               ex.append(temp)
               exp=suivi_client.query.all()
               mi=exo.suivi_data(exp,ex)
               name="Suivicx_"+gen_name()
               return exo.export(mi,name)
            if Type == 'suivip':
               temp=app.config['SUIV']
               ex=[]
               ex.append(temp)
               exp=list(suivi_prospect.query.all())
               mi=exo.suivip_data(exp,ex)
               name="Suivipx_"+gen_name()
               return exo.export(mi,name)
            if Type == 'tarif':
               temp=app.config['TARIFS']
               ex=[]
               ex.append(temp)
               exp=Tarifs.query.all()
               mi=exo.taaf(exp,ex)
               name="Tarifcx_"+gen_name()
               return exo.export(mi,name)
            

    return redirect(url_for('users.main'))


@users.route('/dashboard/expertmission')
def expertmission():
    missionspermonth=db.session.execute('SELECT date_trunc(:param,"date_cmpte_mensuel") AS date_cmpte_mensuel, COUNT(*) as TotalCount,SUM("total") as SumTotal FROM public.compte_mensuel WHERE date_trunc(:param2,"date_cmpte_mensuel") = date_trunc(:param2,current_date) GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year'}) #do for month

    data=[]

    for mission in missionspermonth:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%d. %m. %Y'),"number":str(mission[1]),"Total":str(mission[2])}
            data.append(a)

    #json_dump = json.dumps(data)
    
    return {
        'res':1,
        'data':data
    },200
@users.route('/dashboard/missionperyear')
def dash():
    ####page = request.args.get('page',1,type=int)
    #mission_date=list(Mission.query.filter(extract('year', Mission.DATE_REALISE_EDL )==2020).group_by(Mission.id,extract('year', Mission.DATE_REALISE_EDL )==2020).paginate(page=page ,per_page=50).items)
    #for i in mission_date:
     #   print(i.DATE_REALISE_EDL)
    #a=[]

    #return {
    #    'res':1,
    #    'List':a
    #}
    missionsperyear=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL, COUNT(*) as TotalCount FROM public."Mission" GROUP BY 1 ORDER BY 1 ',{"param":'year'}) #year
    data=[]

    for mission in missionsperyear:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%Y'),"total":str(mission[1])}
            data.append(a)

    #data = json.dumps(data)
    
    return {
        'res':1,
        'data':data
    },200

@users.route('/dashboard/missionpermonth')
def missionpermonth():
    missionspermonth=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL, COUNT(*) as TotalCount FROM public."Mission" WHERE date_trunc(:param2,"DATE_REALISE_EDL") = date_trunc(:param2,current_date) GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year'}) #do for month

    data=[]

    for mission in missionspermonth:
        if mission[0]!=None:
            a={"month":mission[0].strftime('%B').capitalize(),"total":str(mission[1])}
            data.append(a)

    #json_dump = json.dumps(data)
    
    return {
        'res':1,
        'data':data
    },200

@users.route('/dashboard/currentmonth')
def currentmonth():
    missionspermonth=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL, COUNT(*) as TotalCount FROM public."Mission" WHERE date_trunc(:param,"DATE_REALISE_EDL") = date_trunc(:param,current_date) GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year'}) #do for month

    data=[]

    for mission in missionspermonth:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%d. %m. %Y'),"total":str(mission[1])}
            data.append(a)

    #json_dump = json.dumps(data)
    
    return {
        'res':1,
        'data':data
    },200
@users.route('/dashboard/expertmissionpermonth')
def expertmissionpermonth():
    
    expertmissionpermonth=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL,COUNT(*) as TotalCount FROM public."Mission" WHERE ("ID_AS"=:param3 OR "ID_INTERV"=:param3) AND "DATE_REALISE_EDL"=date_trunc(:param2,"DATE_REALISE_EDL") GROUP BY 1   ORDER BY 1 ',{"param":'month',"param2":'year',"param3":current_user.id})
   
    data={}

    data=[]

    for mission in expertmissionpermonth:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%Y'),"total":str(mission[1])}
            data.append(a)

    
    #json_dump = json.dumps(data)
 
    
    return {
        'res':1,
        'data':data
    },200
@users.route('/dashboard/expertencashperyear')
def expertencashperyear():
    expertencashperyear=db.session.execute('SELECT date_trunc(:param2,"date_retrait_facture") AS date_retrait_facture, SUM("commision") as SumTotal FROM public.expert_facturation WHERE "expert_id" =:param3 AND "date_retrait_facture" IS NOT NULL GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year',"param3":current_user.id})  

    data={}

    data=[]

    for mission in expertencashperyear:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%Y'),"total":str(mission[1])}
            data.append(a)

    
    #json_dump = json.dumps(data)
 
    
    return {
        'res':1,
        'data':data
    },200
@users.route('/dashboard/expertencashpermonth')
def expertencashpermonth():
    expertencashpermonth=db.session.execute('SELECT date_trunc(:param2,"date_retrait_facture") AS date_retrait_facture, SUM("commision") as SumTotal FROM public.expert_facturation WHERE "expert_id" =:param3 AND "date_retrait_facture" IS NOT NULL GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year',"param3":current_user.id})  

    data={}

    data=[]

    for mission in expertencashpermonth:
        if mission[0]!=None:
            a={"month":mission[0].strftime('%B').capitalize(),"total":str(mission[1])}
            data.append(a)

    
    #json_dump = json.dumps(data)
 
    
    return {
        'res':1,
        'data':data
    },200
@users.route('/dashboard/missionencashyear')
def mission_encashyear():
    mission_encashyear=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL, SUM("PRIX_HT_EDL") as SumTotal FROM public."Mission" WHERE "DATE_FACT_REGLEE" IS NOT NULL  GROUP BY 1 ORDER BY 1 ',{"param":'year'})

    data={}

    data=[]

    for mission in mission_encashyear:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%Y'),"total":str(mission[1])}
            data.append(a)

    
    #json_dump = json.dumps(data)
 
    
    return {
        'res':1,
        'data':data
    },200
@users.route('/dashboard/missionencashmonth')
def mission_encashmonth():
    mission_encashmonth=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL,COUNT(*) as TotalCount,SUM("PRIX_HT_EDL") as SumTotal FROM public."Mission" WHERE "DATE_FACT_REGLEE" IS NOT NULL and date_trunc(:param2,"DATE_REALISE_EDL") = date_trunc(:param2,current_date)  GROUP BY 1 ORDER BY 1 ',{"param":'month',"param2":'year'})

    data=[]

    for mission in mission_encashmonth:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%d. %m. %Y'),"number":str(mission[1]),"Total":str(mission[2])}
            data.append(a)

    #json_dump = json.dumps(data)
    
    return {
        'res':1,
        'data':data
    },200
'''@users.route('/dashboard/missiondeficityear')
def mission_deficityear():
    mission_deficityear=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL, SUM("PRIX_HT_EDL") as SumTotal FROM public."Mission" WHERE "DATE_FACT_REGLEE" IS NULL  GROUP BY 1 ORDER BY 1 ',{"param":'year'})
    data=[]

    for mission in mission_deficityear:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%d. %m. %Y'),"total":str(mission[1])}
            data.append(a)
    #json_dump = json.dumps(data)
    
    return {
        'res':1,
        'data':data
    },200'''
'''
@users.route('/dashboard/missiondeficitmonth')
def mission_deficitmonth():
    mission_deficitmonth=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL, SUM("PRIX_HT_EDL") as SumTotal FROM public."Mission" WHERE "DATE_FACT_REGLEE" IS NULL  GROUP BY 1 ORDER BY 1 ',{"param":'month'})
    data=[]

    for mission in mission_deficitmonth:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%d. %m. %Y'),"total":str(mission[1])}
            data.append(a)

    #json_dump = json.dumps(data)
    
    return {
        'res':1,
        'data':data
    },200

@users.route('/dashboard/missionnotworkedm')
def missionnotworkedm():
    missionnotworked=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL, SUM("PRIX_HT_EDL") as SumTotal FROM public."Mission" WHERE "NRO_FACTURE" IS NULL  GROUP BY 1 ORDER BY 1 ',{"param":'month'})
    data=[]

    for mission in missionnotworked:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%d. %m. %Y'),"total":str(mission[1])}
            data.append(a)

    #json_dump = json.dumps(data)
    
    return {
        'res':1,
        'data':data
    },200

@users.route('/dashboard/missionnotworkedy')
def missionnotworkedy():
    missionnotworkedy=db.session.execute('SELECT date_trunc(:param,"DATE_REALISE_EDL") AS DATE_REALISE_EDL, SUM("PRIX_HT_EDL") as SumTotal FROM public."Mission" WHERE "NRO_FACTURE" IS NOT NULL  GROUP BY 1 ORDER BY 1 ',{"param":'year'})
    data=[]

    for mission in missionnotworkedy:
        if mission[0]!=None:
            a={"year":mission[0].strftime('%d. %m. %Y'),"total":str(mission[1])}
            data.append(a)

    
    
    return {
        'res':1,
        'data':data
    },200'''

'''@users.route("/p")
def p():
    name = "Giovanni Smith"
    #image_path='C:/Users/user/Desktop/api/update_amexpert/fabrice/Database_Database_project.project/Database_project.project/data_base_/static/images/logo/logo.jpeg'
    
    #with open(image_path, 'rb') as image_file:
    #    image= base64.b64encode(image_file.read()).decode()
    html = render_template(
        "manage/pages/test1.html",param=name)#,image=image)
    config = pdfkit.configuration(wkhtmltopdf=wkhtmltopdf)
    pdf = pdfkit.from_string(html, False, configuration=config)
    response = make_response(pdf)
    response.headers["Content-Type"] = "application/pdf"
    response.headers["Content-Disposition"] = "inline; filename=output.pdf"
    return response'''
