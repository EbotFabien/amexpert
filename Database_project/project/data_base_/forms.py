from flask_wtf import FlaskForm,RecaptchaField, Recaptcha
from flask_wtf.file import FileField, FileAllowed
from flask_login import current_user
from wtforms import StringField,PasswordField,SubmitField,BooleanField,SelectField, IntegerField,DecimalField,TextAreaField,HiddenField
from wtforms.validators import DataRequired,length,Email,EqualTo,ValidationError,Optional
from project.data_base_.Models import Expert ,Client,Tarif_base,Client_negotiateur,prospect
from wtforms.fields.html5 import DateField
from sqlalchemy import or_, and_, desc,asc
from flask import Flask,render_template,url_for,flash,redirect,request,Blueprint
from datetime import date,timedelta,datetime



def validatep(self,email):
        try :
            int(email.data)
        except:
            raise ValidationError("Le numero n'a pas ete bien saisie")

class RegistrationForm1(FlaskForm):
    
    username =StringField("Identifiant",
                                validators=[DataRequired(),length(min=4 ,max=20)])

    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])#,validate_email])

    submit = SubmitField('enregistrer')

class rectify_Form(FlaskForm):
    
    TYPE_LOGEMENT =  StringField("TYPE_LOGEMENT",
                        validators=[DataRequired()])	

    CODE_FACTURATION =StringField("CODE_FACTURATION",
                        validators=[DataRequired()])  	

    submit = SubmitField('Modifier')

class RegistrationForm(FlaskForm):
    def validate_email(self,email):
        email = Expert.query.filter_by(email=email.data).first()

        if email:
            raise ValidationError('Cet e-mail est déjà utilisé par un autre utilisateur')

    def validate_username(self,username): 
        user = Expert.query.filter_by(nom=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    username =StringField("Identifiant",
                                validators=[DataRequired(),length(min=4 ,max=20)])
    
    Numero =StringField('Tel',
                                validators=[DataRequired(),validatep,length(min=4 ,max=10)])

    email =StringField('E-mail',
                           validators=[DataRequired(),Email(),validate_email])

    password =PasswordField('Mot de pass',
                                  validators=[length(min=8 ,max=20)])

    confirm_password =PasswordField('Confirmer le mot de pass',
                                  validators=[EqualTo('password')])
    
    email_perso =StringField('E-mail perso')

    Type_Expert=SelectField('Type d\'expert',
                             choices=[('Interv', 'Interv'), ('CONCESS', 'CONCESS'), ('agent Cell Dev', 'agent Cell Dev'),('Interv', 'Interv'),('Suiveur Cell Tech', 'Suiveur Cell Tech'),('Suiveur Cell Planif', 'Suiveur Cell Planif'),('Admin', 'Admin'),('Audit', 'Audit')])

    Sexe=SelectField('Genre',
                             choices=[('MME', 'MME'), ('M.', 'M.')])
    
    secteur =StringField('Secteur')


    siret =IntegerField('siret')

    trigramme =StringField('trigramme')

    code_tva =StringField('Code tva')
                        
    taux_tva =DecimalField('Taux tva')

    actif_parti =SelectField('actif_parti',
                             choices=[('ACTIF', 'ACTIF'), ('PARTI', 'PARTI')])

    ville =StringField('Ville')
    
    type_certification=StringField('Type certification',
                           validators=[DataRequired()])
    date_certification=DateField('Date de certification',
                           validators=[DataRequired()])
    date_certification_renouv=DateField('Date de recertification')
    adresse=StringField('Adresse 1')

    adresse2=StringField('Adresse 2')

    cp=IntegerField('CP')
    login_google=StringField('login google')
    pwd_google=StringField('Pwd google')
    login_backof=StringField('login_backof')
    pwd_backof=StringField('pwd_backof') #endeavour to hash all passwords
    login_extranet=StringField('login_extranet')
    pwd_extranet=StringField('pwd_extranet')
    pwd_gsuite=StringField('pwd_gsuite')
    Expert_id=HiddenField()
    observations_de_suivi=StringField('observations_de_suivi')

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')
    
    

    


class Expert_editForm(FlaskForm):
    def validate2(self,email,expert):
        email = Expert.query.filter(and_(Expert.email==email,Expert.id!=expert)).first()

        if email:
            return True

    username =StringField("Identifiant",
                                validators=[DataRequired(),length(min=4 ,max=20)])
    
    Numero =StringField('Tel',
                                validators=[DataRequired(),validatep,length(min=4 ,max=20)])

    email =StringField('E-mail')

    email_perso =StringField('E-mail perso')


    Sexe=SelectField('Genre',
                             choices=[('MME', 'MME'), ('M.', 'M.')])


    Type =SelectField('Type',
                             choices=[('Interv', 'Interv'), ('CONCESS', 'CONCESS'), ('agent Cell Dev', 'agent Cell Dev'),('Interv', 'Interv'),('Suiveur Cell Tech', 'Suiveur Cell Tech'),('Suiveur Cell Planif', 'Suiveur Cell Planif'),('Admin', 'Admin'),('Audit', 'Audit')])


    secteur =StringField('Secteur')


    siret =IntegerField('siret')

    trigramme =StringField('trigramme')

    code_tva =StringField('Code tva')
                        
    taux_tva =DecimalField('Taux tva')

    actif_parti =SelectField('actif_parti',
                             choices=[('ACTIF', 'ACTIF'), ('PARTI', 'PARTI')])

    ville =StringField('Ville')
    
    type_certification=StringField('Type certification',
                           validators=[DataRequired()])
    date_certification=DateField('Date de certification',
                           validators=[DataRequired()])
    date_certification_renouv=DateField('Date de recertification')
    
    date_entree=StringField('Date de entree',render_kw={'readonly':True})


    mdp=DateField('Date de sortie')

    adresse=StringField('Adresse 1')

    adresse2=StringField('Adresse 2')

    cp=IntegerField('CP')
    login_google=StringField('login google')
    pwd_google=StringField('Pwd google')
    login_backof=StringField('login_backof')
    pwd_backof=StringField('pwd_backof') #endeavour to hash all passwords
    login_extranet=StringField('login_extranet')
    pwd_extranet=StringField('pwd_extranet')
    pwd_gsuite=StringField('pwd_gsuite')
    Expert_id=HiddenField()
    observations_de_suivi=StringField('observations_de_suivi')

    modifier = SubmitField('modifier')

class RequestResetForm(FlaskForm):
    email =StringField('Email',
                           validators=[DataRequired(),Email()])
    submit = SubmitField('Request Password Reset')

    #recaptcha = RecaptchaField(validators=[Recaptcha(message="Le reCAPTCHA n'a pas été saisi correctement. Revenez en arrière et essayez à nouveau.")])

    def validate_username(self,username):
        user = Expert.query.filter_by(EMAIL=email.data).first()## add visibility

        if user is None:
            raise ValidationError('There is no account with this email.You must register first.')

class ResetPasswordForm(FlaskForm):
    password =PasswordField('Password',
                                  validators=[DataRequired(),length(min=8 ,max=20)])
    confirm_password =PasswordField('ConfirmPassword',
                                  validators=[DataRequired(),EqualTo('password')])
    submit = SubmitField('Reset password')
class LoginForm(FlaskForm):
    username =StringField("Identifiant",
                                     validators=[DataRequired(),length(min=4 ,max=20, message='Le champ est obligatoire')])

    password =PasswordField('Mot de passe',
                                  validators=[DataRequired(),length(min=4 ,max=20, message="Le champ doit comporter entre 4 et 20 caractères.")])

    remember = BooleanField('Remember me')                              
    submit = SubmitField('Se connecter')
    
class tableform(FlaskForm):
        table =StringField('table',validators=[DataRequired()])

        submit = SubmitField('Recherchez')



class Tarif_Form(FlaskForm):
    def validate_email(self,email):
        email = Expert.query.filter_by(id=email.data).first()

        if email is None :
            raise ValidationError("Cette utilisateur n'existe pas, utilisé  un autre utilisateur")

    def validate_price_STD(self,edl_prix_std): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='STD')).first()
            if edl_prix_std == 0:
                raise ValidationError("Veuillez mettre une bonne valeur") 

            if base.Prix_EDL>edl_prix_std.data:
               
                raise ValidationError("le tarif de base  STD es moin que le tarif normal "+str(base.Prix_EDL)+"€")
    def validate_price_F1(self,edl_appt_prix_f1): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F1')).first()
            
            if edl_appt_prix_f1.data == 0:
                raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_appt_prix_f1.data:
                raise ValidationError("le tarif de base F1 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_F2(self,edl_appt_prix_f2): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F2')).first()
            
            if edl_appt_prix_f2.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_appt_prix_f2.data:
                raise ValidationError("le tarif de base F2 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_F3(self,edl_appt_prix_f3): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F3')).first()
            
            if edl_appt_prix_f3.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_appt_prix_f3.data:
                raise ValidationError("le tarif de base F3 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_F4(self,edl_appt_prix_f4): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F4')).first()
            
            if edl_appt_prix_f4.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_appt_prix_f4.data:
                raise ValidationError("le tarif de base F4 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_F5(self,edl_appt_prix_f5): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F5')).first()
            
            if edl_appt_prix_f5.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_appt_prix_f5.data:
                raise ValidationError("le tarif de base F5 es moin que le tarif normal "+str(base.Prix_EDL)+"€")
    
    def validate_price_F6(self,edl_appt_prix_f6): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F6')).first()
            
            if edl_appt_prix_f6.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_appt_prix_f6.data:
                raise ValidationError("le tarif de base F6 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

#PRIX CHIFFRAGE APPARTEMENT
    def validate_chif_STD(self,chif_appt_prix_stu): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='STD')).first()
            
            if chif_appt_prix_stu.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_appt_prix_stu.data:
                raise ValidationError("le tarif de base  STD es moin aue le tarif normal "+str(base.Prix_EDL)+"€")
    
    def validate_chif_F1(self,chif_appt_prix_f1): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F1')).first()
            
            if chif_appt_prix_f1.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_appt_prix_f1.data:
                raise ValidationError("le tarif de base F1 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_F2(self,chif_appt_prix_f2): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F2')).first()
            
            if chif_appt_prix_f2.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_appt_prix_f2.data:
                raise ValidationError("le tarif de base F2 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_F3(self,chif_appt_prix_f3): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F3')).first()
            
            if chif_appt_prix_f3.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_appt_prix_f3.data:
                raise ValidationError("le tarif de base F3 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_F4(self,chif_appt_prix_f4): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F4')).first()
            
            if chif_appt_prix_f4.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_appt_prix_f4.data:
                raise ValidationError("le tarif de base F4 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_F5(self,chif_appt_prix_f5): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F5')).first()
            
            if chif_appt_prix_f5.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_appt_prix_f5.data:
                raise ValidationError("le tarif de base F5 es moin que le tarif normal "+str(base.Prix_EDL)+"€")
    
    def validate_chif_F6(self,chif_appt_prix_f6): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='F6')).first()
            
            if chif_appt_prix_f6.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_appt_prix_f6.data:
                raise ValidationError("le tarif de base F6 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    
#PRICE VILLA
    def validate_price_T1(self,edl_pav_villa_prix_t1): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T1')).first()
            
            if edl_pav_villa_prix_t1.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_pav_villa_prix_t1.data:
                raise ValidationError("le tarif de base T1 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_T2(self,edl_pav_villa_prix_t2): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T2')).first()
            
            if edl_pav_villa_prix_t2.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_pav_villa_prix_t2.data:
                raise ValidationError("le tarif de base T2 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_T3(self,edl_pav_villa_prix_t3): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T3')).first()
            
            if edl_pav_villa_prix_t3.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_pav_villa_prix_t3.data:
                raise ValidationError("le tarif de base T3 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_T4(self,edl_pav_villa_prix_t4): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T4')).first()
            
            if edl_pav_villa_prix_t4.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_pav_villa_prix_t4.data:
                raise ValidationError("le tarif de base T4 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_T5(self,edl_pav_villa_prix_t5): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T5')).first()
            
            if edl_pav_villa_prix_t5.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_pav_villa_prix_t5.data:
                raise ValidationError("le tarif de base T5 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_T6(self,edl_pav_villa_prix_t6): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T6')).first()
            
            if edl_pav_villa_prix_t6.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_pav_villa_prix_t6.data:
                raise ValidationError("le tarif de base T6 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    
    def validate_price_T7(self,edl_pav_villa_prix_t7): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T7')).first()
            
            if edl_pav_villa_prix_t7.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_pav_villa_prix_t7.data:
                raise ValidationError("le tarif de base T7 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_price_T8(self,edl_pav_villa_prix_t8): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T8')).first()
            
            if edl_pav_villa_prix_t8.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>edl_pav_villa_prix_t8.data:
                raise ValidationError("le tarif de base T8 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

#Prix CHiffrage Pav
    def validate_chif_T1(self,chif_pav_villa_prix_t1): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T1')).first()
            
            if chif_pav_villa_prix_t1.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_pav_villa_prix_t1.data:
                raise ValidationError("le tarif de base T1 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_T2(self,chif_pav_villa_prix_t2): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T2')).first()
            
            if chif_pav_villa_prix_t2.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_pav_villa_prix_t2.data:
                raise ValidationError("le tarif de base T2 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_T3(self,chif_pav_villa_prix_t3): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T3')).first()
            
            if chif_pav_villa_prix_t3.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_pav_villa_prix_t3.data:
                raise ValidationError("le tarif de base T3 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_T4(self,chif_pav_villa_prix_t4): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T4')).first()
            
            if chif_pav_villa_prix_t4.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_pav_villa_prix_t4.data:
                raise ValidationError("le tarif de base T4 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_T5(self,chif_pav_villa_prix_t5): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T5')).first()
            
            if chif_pav_villa_prix_t5.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_pav_villa_prix_t5.data:
                raise ValidationError("le tarif de base T5 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_T6(self,chif_pav_villa_prix_t6): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T6')).first()
            
            if chif_pav_villa_prix_t6.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_pav_villa_prix_t6.data:
                raise ValidationError("le tarif de base T6 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    
    def validate_chif_T7(self,chif_pav_villa_prix_t7): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T7')).first()
            
            if chif_pav_villa_prix_t7.data == 0:
                 raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_pav_villa_prix_t7.data:
                raise ValidationError("le tarif de base T7 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    def validate_chif_T8(self,chif_pav_villa_prix_t8): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='PAV',Tarif_base.Type=='T8')).first()
            
            if chif_pav_villa_prix_t8.data == 0:
                raise ValidationError("Veuillez mettre une bonne valeur")

            if base.Prix_EDL>chif_pav_villa_prix_t8.data:
                raise ValidationError("le tarif de base T8 es moin que le tarif normal "+str(base.Prix_EDL)+"€")

    edl_prix_std=DecimalField('edl_prix_std', validators=[validate_price_STD])     
    edl_appt_prix_f1=DecimalField('edl_appt_prix_f1', validators=[validate_price_F1])
    edl_appt_prix_f2=DecimalField('edl_appt_prix_f2', validators=[validate_price_F2]) 
    edl_appt_prix_f3=DecimalField('edl_appt_prix_f3', validators=[validate_price_F3])
    edl_appt_prix_f4=DecimalField('edl_appt_prix_f4', validators=[validate_price_F4]) 
    edl_appt_prix_f5=DecimalField('edl_appt_prix_f5', validators=[validate_price_F5])
    edl_appt_prix_f6=DecimalField('edl_appt_prix_f6', validators=[validate_price_F6])
    edl_pav_villa_prix_t1=DecimalField('edl_pav_villa_prix_t1', validators=[validate_price_T1])
    edl_pav_villa_prix_t2=DecimalField('edl_pav_villa_prix_t2', validators=[validate_price_T2])
    edl_pav_villa_prix_t3=DecimalField('edl_pav_villa_prix_t3', validators=[validate_price_T3])
    edl_pav_villa_prix_t4=DecimalField('edl_pav_villa_prix_t4', validators=[validate_price_T4]) 
    edl_pav_villa_prix_t5=DecimalField('edl_pav_villa_prix_t5', validators=[validate_price_T5])
    edl_pav_villa_prix_t6=DecimalField('edl_pav_villa_prix_t6', validators=[validate_price_T6])
    edl_pav_villa_prix_t7=DecimalField('edl_pav_villa_prix_t7', validators=[validate_price_T7]) 
    edl_pav_villa_prix_t8=DecimalField('edl_pav_villa_prix_t8', validators=[validate_price_T8])
    chif_appt_prix_stu=DecimalField('chif_appt_prix_stu', validators=[validate_chif_STD])
    chif_appt_prix_f1 =DecimalField('chif_appt_prix_f1', validators=[validate_chif_F1]) 
    chif_appt_prix_f2 =DecimalField('chif_appt_prix_f2', validators=[validate_chif_F2]) 
    chif_appt_prix_f3 =DecimalField('chif_appt_prix_f3', validators=[validate_chif_F3]) 
    chif_appt_prix_f4 =DecimalField('chif_appt_prix_f4', validators=[validate_chif_F4]) 
    chif_appt_prix_f5 =DecimalField('chif_appt_prix_f5', validators=[validate_chif_F5]) 
    chif_appt_prix_f6 =DecimalField('chif_appt_prix_f6', validators=[validate_chif_F6]) 
    chif_pav_villa_prix_t1=DecimalField('chif_pav_villa_prix_t1', validators=[validate_chif_T1])
    chif_pav_villa_prix_t2=DecimalField('chif_pav_villa_prix_t2', validators=[validate_chif_T2]) 
    chif_pav_villa_prix_t3=DecimalField('chif_pav_villa_prix_t3', validators=[validate_chif_T3])
    chif_pav_villa_prix_t4=DecimalField('chif_pav_villa_prix_t4', validators=[validate_chif_T4])
    chif_pav_villa_prix_t5=DecimalField('chif_pav_villa_prix_t5', validators=[validate_chif_T5])
    chif_pav_villa_prix_t6=DecimalField('chif_pav_villa_prix_t6', validators=[validate_chif_T6])
    chif_pav_villa_prix_t7=DecimalField('chif_pav_villa_prix_t7', validators=[validate_chif_T7]) 
    chif_pav_villa_prix_t8=DecimalField('chif_pav_villa_prix_t8', validators=[validate_chif_T8])
    prix_autre=StringField('prix_autre', validators=[Optional()])

    code_tva= StringField('code tva', validators=[Optional()])

    taux_meuble= IntegerField('taux_meuble', validators=[Optional()])

    referent_as_client= IntegerField('referent_as_client', validators=[DataRequired(),validate_email])

    com_as_sur_ca_client=DecimalField('com_as_sur_ca_client', validators=[DataRequired()])

    cell_dev_ref_responsable = IntegerField('cell_dev_ref_responsable', validators=[DataRequired(),validate_email])

    com_cell_dev_ref_responsable = DecimalField('com_cell_dev_ref_responsable', validators=[DataRequired()])

    cell_dev_ref_agent = IntegerField('cell_dev_ref_agent', validators=[DataRequired(),validate_email])

    com_cell_dev_ref_agent = DecimalField('com_cell_dev_ref_agent', validators=[DataRequired()])

    cell_tech_ref_agent = IntegerField('cell_tech_ref_agent', validators=[DataRequired(),validate_email])

    com_cell_tech_Ref_agent = DecimalField('com_cell_tech_Ref_agent', validators=[DataRequired()])

    cell_tech_ref_responsable  = IntegerField('cell_tech_ref_responsable', validators=[DataRequired(),validate_email])

    com_cell_tech_ref_responsable = DecimalField('com_cell_tech_ref_responsable')

    cell_tech_ref_suiveur = IntegerField('cell_tech_ref_suiveur', validators=[DataRequired(),validate_email])

    com_cell_tech_ref_suiveur  = DecimalField('com_cell_tech_ref_suiveur')

    cell_planif_ref_responsable = IntegerField('cell_planif_ref_responsable', validators=[DataRequired(),validate_email])

    com_cell_planif_ref_responsable = DecimalField('com_cell_planif_ref_responsable')

    cell_planif_ref_suiveur = IntegerField('cell_planif_ref_suiveur', validators=[DataRequired(),validate_email])

    com_cell_planif_ref_suiveur  =  DecimalField('com_cell_planif_ref_suiveur')

    cell_planif_ref_agent_saisie  =  IntegerField('cell_planif_ref_agent_saisie', validators=[DataRequired(),validate_email])

    com_cell_planif_ref_agent_saisie  =  DecimalField('com_cell_planif_ref_agent_saisie')

    commentaire_libre = TextAreaField('commentaire_libre', validators=[Optional()])

    tafid =HiddenField()
    
    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')

    
    
   


class Facturation_Form(FlaskForm):
    Reference_client=IntegerField('Reference client',
                           render_kw={'readonly':True})

    Demarrer=StringField('Demarrer',
                           render_kw={'readonly':True})

    Fin=StringField('Fin',
                           render_kw={'readonly':True})
    
    Montant_HT =StringField('Montant HT€',
                             render_kw={'readonly':True})


    Data=HiddenField()

    Missions=HiddenField()

    Mission =StringField('Mission ID',
                             render_kw={'readonly':True})

    
    Statut=SelectField('Statut',
                             choices=[('paye', 'paye'), ('attente', 'attente')])
    
    #Observations_suivi_paiement=SelectField('Type_',
                            # choices=[('Entrant', 'Entrant'), ('Sortant', 'Sortant')])


    submit = SubmitField('enregistrer')

class Facturationex_Form(FlaskForm):
    
    Demarrer=StringField('Demarrer',
                           render_kw={'readonly':True})

    Fin=StringField('Fin',
                           render_kw={'readonly':True})
    
    Montant_HT =StringField('Montant HT€',
                             render_kw={'readonly':True})
    
    Total_HT =StringField('Total HT€',
                             render_kw={'readonly':True})


    Date_EDL=StringField('Date EDL',
                           render_kw={'readonly':True})
    Data=HiddenField()

    Missions=HiddenField()

    Mission =StringField('Mission ID',
                             render_kw={'readonly':True})

    
    Statut=SelectField('Statut',
                             choices=[('paye', 'paye'), ('attente', 'attente')])
    

    submit = SubmitField('Genere')


class Client_Form(FlaskForm):
       
    Type=SelectField('Type',
                             choices=[('Professionnel', 'Professionnel'), ('Particulier', 'Particulier')])

    Societe =StringField('Société',
                           validators=[DataRequired()])

    Sexe=SelectField('Titre',
                             choices=[('Monsieur', 'Monsieur',), ('Madame', 'Madame'), ('Mademoiselle', 'Mademoiselle')])

    NOM =StringField('Nom et prénom',
                           validators=[DataRequired()])
    
    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])

    Numero =StringField('Tel',
                           validators=[validatep])

    Adresse1=StringField('Adresse1')
    
    Adresse2=StringField('Adresse2')

    CP=IntegerField('Code Postal',
                           validators=[DataRequired()])
    
    Ville=StringField('Ville',
                           validators=[DataRequired()])
    
    Siret=IntegerField("Siret N°",
                           validators=[DataRequired()])

    Pays=SelectField("Pays ", choices=[('France', 'France'), ('Belgique', 'Belgique')],
                        validators=[DataRequired()])

    Reference=IntegerField("Reference")
    
    Date_Creation=StringField("Date_Creation",
                           render_kw={'readonly':True})

    EtatClient=SelectField("EtatClient", choices=[('Actif', 'Actif'), ('Parti', 'Parti')],
                        validators=[DataRequired()])

    LoginExtranet = StringField("Login Extranet")

    MdpExtranet = StringField("MdpExtranet")


    Enseigne=StringField("Enseigne")

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')



    def validate_username(self,username):
        user = Client.query.filter_by(nom=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    def validate_email(self,email):
        email = Client.query.filter_by(email=email.data).first()

        if email:
            raise ValidationError('Cet e-mail est déjà utilisé par un autre utilisateur')

class Client_edit(FlaskForm):

    def validate2(self,email,client):
        email = Client.query.filter(and_(Client.email==email,Client.id!=client)).first()

        if email:
            return True
        
    def validate3(self,email,client):
        email = prospect.query.filter(and_(prospect.email==email,prospect.id!=client)).first()

        if email:
            return True
    
    

    Type=SelectField('Type',
                             choices=[('Professionnel', 'Professionnel'), ('Particulier', 'Particulier')])

    Societe =StringField('Société',
                           validators=[DataRequired()])

    Sexe=SelectField('Titre',
                             choices=[('Monsieur', 'Monsieur'), ('Madame', 'Madame'), ('Mademoiselle', 'Mademoiselle')])

    NOM =StringField('Nom et prénom',
                           validators=[DataRequired()])
    
    email =StringField('E-mail')

    Numero =StringField('Tel',
                           validators=[validatep])

    Adresse1=StringField('Adresse1')
    
    Adresse2=StringField('Adresse2')

    CP=IntegerField('Code Postal',
                           validators=[DataRequired()])
    
    Ville=StringField('Ville',
                           validators=[DataRequired()])
    
    Siret=IntegerField("Siret N°",
                           validators=[DataRequired()])

    Pays=SelectField("Pays ", choices=[('France', 'France'), ('Belgique', 'Belgique')],
                        validators=[DataRequired()])

    Reference=IntegerField('Reference',
                           validators=[DataRequired()])
    
    Date_Creation=StringField("Date_Creation",
                           render_kw={'readonly':True})

    EtatClient=StringField("Etat du client")
    LoginExtranet = StringField("Login Extranet")

    MdpExtranet = StringField("MdpExtranet")

    client_id = HiddenField()

    Enseigne=StringField("Enseigne")

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')



    def validate_username(self,username):
        user = Client.query.filter_by(nom=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")


class Negotiateur_Form(FlaskForm):

    def nego(self,email,cont):
        email = Client_negotiateur.query.filter(and_(Client_negotiateur.email==email,Client_negotiateur.id!=cont)).first()

        if email:
            return True
       

    Sexe=SelectField('Titre',
                             choices=[('Monsieur', 'Monsieur'), ('Madame', 'Madame'), ('Mademoiselle', 'Mademoiselle')])

    NOM =StringField('Nom et prénom',
                           validators=[DataRequired()])
    
    email =StringField('E-mail')

    Numero =StringField('Tel',
                           validators=[validatep])

    Adresse=StringField('Adresse')

    CP=IntegerField('Code Postal',
                           validators=[DataRequired()])
    
    Ville=StringField('Ville')
    
    client_id = HiddenField()

    Date_Creation=StringField("Date_Creation",
                           render_kw={'readonly':True})

    Pays=SelectField("Pays ", choices=[('France', 'France'), ('Belgique', 'Belgique')])

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')



    def validate_username(self,username):
        user = Client_negotiateur.query.filter_by(nom=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    
    

class Negotiateur_Form1(FlaskForm):  

    Sexe=SelectField('Titre',
                             choices=[('Monsieur', 'Monsieur'), ('Madame', 'Madame'), ('Mademoiselle', 'Mademoiselle')])

    NOM =StringField('Nom et prénom',
                           validators=[DataRequired()])
    
    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])

    Numero =StringField('Tel',
                           validators=[validatep])

    Adresse=StringField('Adresse')

    CP=IntegerField('Code Postal',
                           validators=[DataRequired()])
    
    Ville=StringField('Ville')
    

    Pays=SelectField("Pays ", choices=[('France', 'France'), ('Belgique', 'Belgique')])

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')



    def validate_username(self,username):
        user = Client_negotiateur.query.filter_by(nom=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    def validate_email(self,email):
        email = Client_negotiateur.query.filter_by(email=email.data).first()

        if email:
            raise ValidationError('Cet e-mail est déjà utilisé par un autre utilisateur')

class Suivi_Client(FlaskForm):
    def validate_email(self,email):
        email = Expert.query.filter(and_(Expert.trigramme==email.data.lower(),Expert.trigramme!='')).first()

        if email is None:
            raise ValidationError("cette expert n'existe pas,veuillez re saisie le trigramme")

    expert=StringField("Trigramme Expert",
                        validators=[DataRequired(),validate_email])

    commentaire=StringField("commentaire",
                        validators=[DataRequired()])

    submit = SubmitField('enregistrer')



class Mission_add(FlaskForm):
    def validate_email(self,email):
        email = Expert.query.filter_by(id=email.data).first()

        if email is None :
            raise ValidationError("Cette utilisateur n'existe pas, utilisé  un autre utilisateur")

    def validate_client(self,email):
        email = Client.query.filter_by(reference=email.data).first()

        if email is None :
            raise ValidationError("Cette utilisateur n'existe pas, utilisé  un autre utilisateur")


    Reference_client=IntegerField("Reference Client",
                        validators=[DataRequired(),validate_client])

    ID_Concessionaire=IntegerField("ID Concessionaire",
                        validators=[DataRequired(),validate_email])

    ABONNEMENT=StringField("ABONNEMENT",
                        validators=[DataRequired()])
    
    PRIX_HT_EDL=DecimalField("PRIX_HT_EDL",
                        validators=[DataRequired()])
    
    DATE_REALISE_EDL=DateField("DATE_REALISE_EDL",
                        validators=[DataRequired()])
    
    DATE_FACTURE=DateField("DATE_FACTURE",render_kw={'readonly':True})

    NRO_FACTURE=StringField("NRO_FACTURE",render_kw={'readonly':True})

    COMMENTAIRE_FACTURE=StringField("COMMENTAIRE_FACTURE",render_kw={'readonly':True})
                        
    DATE_FACT_REGLEE =DateField("DATE_FACT_REGLEE",render_kw={'readonly':True})

    ID_INTERV=IntegerField("ID_INTERV",
                        validators=[DataRequired(),validate_email])
    
    Reference_LOCATAIRE=StringField("Reference_LOCATAIRE",
                        validators=[DataRequired()])
    
    Adresse1_Bien=StringField("Adresse1_Bien",
                        validators=[DataRequired()])
    
    Adresse2_Bien=StringField("Adresse2_Bien",
                        validators=[DataRequired()])
      
    CP_Bien=IntegerField("CP_Bien",
                        validators=[DataRequired()])
    
    Ville_Bien=StringField("Ville_Bien",
                        validators=[DataRequired()])
    
    TVA_EDL=DecimalField("TVA_EDL",
                        validators=[DataRequired()])
    
    PRIX_TTC_EDL=DecimalField("PRIX_TTC_EDL",
                        validators=[DataRequired()])
    
    CA_HT_AS=DecimalField("CA_HT_AS",
                        validators=[DataRequired()])

    TVA_AS=DecimalField("TVA_AS",
                        validators=[DataRequired()])
    
    CA_TTC_AS=DecimalField("CA_TTC_AS",
                        validators=[DataRequired()])
    
    CA_HT_AC=DecimalField("CA_HT_AC",
                        validators=[DataRequired()])
    
    CA_TTC_AC=DecimalField("CA_TTC_AC",
                        validators=[DataRequired()])
    
    CA_HT_TRUST=DecimalField("CA_HT_TRUST",
                        validators=[DataRequired()])
    
    TVA_TRUST=DecimalField("TVA_TRUST",
                        validators=[DataRequired()])
    
    Date_chiffrage_regle=DateField("Date_chiffrage_regle",
                        validators=[DataRequired()])
    
    Prix_ht_chiffrage=DecimalField("Prix_ht_chiffrage",
                        validators=[DataRequired()])
    
    POURCENTAGE_suiveur_chiffrage=DecimalField("POURCENTAGE_suiveur_chiffrage",
                        validators=[DataRequired()])

    POURCENTAGE_AS_chiffrage=DecimalField("POURCENTAGE_AS_chiffrage",
                        validators=[DataRequired()])
    
    POURCENTAGE_manager_chiffrage=DecimalField("POURCENTAGE_manager_chiffrage",
                        validators=[DataRequired()])
    
    ID_manager_chiffrage=IntegerField("ID_manager_chiffrage",
                        validators=[DataRequired(),validate_email])

    POURCENTAGE_agent_chiffrage =DecimalField("POURCENTAGE_agent_chiffrage",
                        validators=[DataRequired()])
    
    ID_agent_chiffrage =IntegerField("ID_agent_chiffrage",
                        validators=[DataRequired(),validate_email])

    TYPE_EDL=StringField("TYPE_EDL",
                        validators=[DataRequired()])
    
    TITREPROPRIO=SelectField('Titre PROPRIO',
                             choices=[('Monsieur', 'Monsieur',), ('Madame', 'Madame'), ('Mademoiselle', 'Mademoiselle')])# select field

    NOMPROPRIO=StringField("NOMPROPRIO",
                        validators=[DataRequired()])


    CODE_AMEXPERT=StringField("CODE_AMEXPERT",
                        validators=[DataRequired()])

    

    surface_logement1=DecimalField("surface_logement1",
                        validators=[DataRequired()])

    Ref_commande=StringField("Ref_commande")
    
    POURCENTAGE_COM_AS_DU_CLIENT=DecimalField("POURCENTAGE_COM_AS_DU_CLIENT",
                        validators=[DataRequired()])
    
    ID_Respon_Cell_Dev=IntegerField("ID_Respon_Cell_Dev",
                        validators=[DataRequired(),validate_email])

    POURCENTAGE_Respon_Cell_Dev=DecimalField("POURCENTAGE_Respon_Cell_Dev")

    ID_agent_Cell_Dev=IntegerField("ID_agent_Cell_Dev",
                        validators=[DataRequired(),validate_email])
    
    TYPE_LOGEMENT =  StringField("TYPE_LOGEMENT",
                        validators=[DataRequired()])	

    LOGEMENT_MEUBLE = StringField("LOGEMENT_MEUBLE",
                        validators=[DataRequired()]) 	
    CODE_FACTURATION =StringField("CODE_FACTURATION",
                        validators=[DataRequired()])  	
    TYPE_DE_BIEN = StringField("TYPE_DE_BIEN",
                        validators=[DataRequired()]) 
    
    POURCENTAGE_Agent_Cell_Dev =  DecimalField("POURCENTAGE_Agent_Cell_Dev")	

    ID_Agent_CellTech = IntegerField("ID_Agent_CellTech",
                        validators=[DataRequired(),validate_email]) 	

    POURCENTAGE_Agent_Cell_Tech =DecimalField("POURCENTAGE_Agent_Cell_Tech")  	

    ID_Respon_Cell_Tech = IntegerField("ID_Respon_Cell_Tech",
                        validators=[DataRequired(),validate_email]) 
    
    POURCENTAGE_Respon_Cell_Tech = DecimalField("POURCENTAGE_Respon_Cell_Tech")
    
    ID_Suiveur_Cell_Tech =  IntegerField("ID_Suiveur_Cell_Tech",
                        validators=[DataRequired(),validate_email])	

    POURCENTAGE_Suiveur_Cell_Tech = DecimalField("POURCENTAGE_Suiveur_Cell_Tech") 	

    ID_Respon_Cell_Planif =IntegerField("ID_Respon_Cell_Planif",
                        validators=[DataRequired(),validate_email])  

    POURCENTAGE_Respon_Cell_Planif = DecimalField("POURCENTAGE_Respon_Cell_Planif") 
    
    ID_Suiveur_Cell_Planif =  IntegerField("ID_Suiveur_Cell_Planif",
                        validators=[DataRequired(),validate_email])	

    POURCENTAGE_Suiveur_Cell_Planif	 = DecimalField("POURCENTAGE_Suiveur_Cell_Planif") 	

    ID_Agent_saisie_Cell_Planif =IntegerField("ID_Agent_saisie_Cell_Planif",
                        validators=[DataRequired(),validate_email])  	

    POURCENTAGE_Agent_saisie_CEll_planif = DecimalField("POURCENTAGE_Agent_saisie_CEll_planif") 

    misid =HiddenField()
    
   
    submit = SubmitField('enregistrer')

    modifier = SubmitField('enregistre')


class Mission_editForm(FlaskForm):

  
    def validate_email(self,email):
        email = Expert.query.filter_by(id=email.data).first()

        if email is None :
            raise ValidationError("Cette utilisateur n'existe pas, utilisé  un autre utilisateur")

    def validate_client(self,email):
        email = Client.query.filter_by(reference=email.data).first()

        if email is None :
            raise ValidationError("Cette utilisateur n'existe pas, utilisé  un autre utilisateur")


    Reference_client=IntegerField("Reference Client",
                        validators=[DataRequired(),validate_client])

    ID_Concessionaire=IntegerField("ID Concessionaire",
                        validators=[DataRequired()])

    ABONNEMENT=StringField("ABONNEMENT",
                        validators=[DataRequired()])
    
    PRIX_HT_EDL=DecimalField("PRIX_HT_EDL",
                        validators=[DataRequired()])
    
    DATE_REALISE_EDL=StringField("DATE_REALISE_EDL",render_kw={'readonly':True})
    
    DATE_FACTURE=StringField("DATE_FACTURE",render_kw={'readonly':True})

    NRO_FACTURE=StringField("NRO_FACTURE",render_kw={'readonly':True})

    COMMENTAIRE_FACTURE=StringField("COMMENTAIRE_FACTURE",render_kw={'readonly':True})
                        
    DATE_FACT_REGLEE =StringField("DATE_FACT_REGLEE",render_kw={'readonly':True})

    ID_INTERV=IntegerField("ID_INTERV",
                        validators=[DataRequired(),validate_email])
    
    Reference_LOCATAIRE=StringField("Reference_LOCATAIRE",
                        validators=[DataRequired()])
    
    Adresse1_Bien=StringField("Adresse1_Bien",
                        validators=[DataRequired()])
    
    Adresse2_Bien=StringField("Adresse2_Bien",
                        validators=[DataRequired()])
      
    CP_Bien=IntegerField("CP_Bien",
                        validators=[DataRequired()])
    
    Ville_Bien=StringField("Ville_Bien",
                        validators=[DataRequired()])
    
    TVA_EDL=DecimalField("TVA_EDL",
                        validators=[DataRequired()])
    
    PRIX_TTC_EDL=DecimalField("PRIX_TTC_EDL",
                        validators=[DataRequired()])
    
    CA_HT_AS=DecimalField("CA_HT_AS",
                        validators=[DataRequired()])

    TVA_AS=DecimalField("TVA_AS",
                        validators=[DataRequired()])
    
    CA_TTC_AS=DecimalField("CA_TTC_AS",
                        validators=[DataRequired()])
    
    CA_HT_AC=DecimalField("CA_HT_AC",
                        validators=[DataRequired()])
    
    CA_TTC_AC=DecimalField("CA_TTC_AC",
                        validators=[DataRequired()])
    
    CA_HT_TRUST=DecimalField("CA_HT_TRUST",
                        validators=[DataRequired()])
    
    TVA_TRUST=DecimalField("TVA_TRUST",
                        validators=[DataRequired()])
    
    Date_chiffrage_regle=DateField("Date_chiffrage_regle",format="%Y-%m-%dT%H:%M:%S",default=datetime.today(),#.strftime('%y. %m. %d'),
                        validators=[DataRequired()])
    
    Prix_ht_chiffrage=DecimalField("Prix_ht_chiffrage",
                        validators=[DataRequired()])
    
    POURCENTAGE_suiveur_chiffrage=DecimalField("POURCENTAGE_suiveur_chiffrage",
                        validators=[DataRequired()])

    POURCENTAGE_AS_chiffrage=DecimalField("POURCENTAGE_AS_chiffrage",
                        validators=[DataRequired()])
    
    POURCENTAGE_manager_chiffrage=DecimalField("POURCENTAGE_manager_chiffrage",
                        validators=[DataRequired()])
    
    ID_manager_chiffrage=IntegerField("ID_manager_chiffrage",
                        validators=[DataRequired(),validate_email])

    POURCENTAGE_agent_chiffrage =DecimalField("POURCENTAGE_agent_chiffrage",
                        validators=[DataRequired()])
    
    ID_agent_chiffrage =IntegerField("ID_agent_chiffrage",
                        validators=[DataRequired(),validate_email])

    TYPE_EDL=StringField("TYPE_EDL",
                        validators=[DataRequired()])
    
    TITREPROPRIO=SelectField('Titre PROPRIO',
                             choices=[('Monsieur', 'Monsieur',), ('Madame', 'Madame'), ('Mademoiselle', 'Mademoiselle')])# select field

    NOMPROPRIO=StringField("NOMPROPRIO",
                        validators=[DataRequired()])


    CODE_AMEXPERT=StringField("CODE_AMEXPERT",
                        validators=[DataRequired()])

    

    surface_logement1=DecimalField("surface_logement1",
                        validators=[DataRequired()])

    Ref_commande=StringField("Ref_commande")
    
    POURCENTAGE_COM_AS_DU_CLIENT=DecimalField("POURCENTAGE_COM_AS_DU_CLIENT",
                        validators=[DataRequired()])
    
    ID_Respon_Cell_Dev=IntegerField("ID_Respon_Cell_Dev",
                        validators=[DataRequired(),validate_email])

    POURCENTAGE_Respon_Cell_Dev=DecimalField("POURCENTAGE_Respon_Cell_Dev")

    ID_agent_Cell_Dev=IntegerField("ID_agent_Cell_Dev",
                        validators=[DataRequired(),validate_email])
    
    TYPE_LOGEMENT =  StringField("TYPE_LOGEMENT",
                        validators=[DataRequired()])	

    LOGEMENT_MEUBLE = StringField("LOGEMENT_MEUBLE",
                        validators=[DataRequired()]) 	
    CODE_FACTURATION =StringField("CODE_FACTURATION",
                        validators=[DataRequired()])  	
    TYPE_DE_BIEN = StringField("TYPE_DE_BIEN",
                        validators=[DataRequired()]) 
    
    POURCENTAGE_Agent_Cell_Dev =  DecimalField("POURCENTAGE_Agent_Cell_Dev")	

    ID_Agent_CellTech = IntegerField("ID_Agent_CellTech",
                        validators=[DataRequired(),validate_email]) 	

    POURCENTAGE_Agent_Cell_Tech =DecimalField("POURCENTAGE_Agent_Cell_Tech")  	

    ID_Respon_Cell_Tech = IntegerField("ID_Respon_Cell_Tech",
                        validators=[DataRequired(),validate_email]) 
    POURCENTAGE_Respon_Cell_Tech = DecimalField("POURCENTAGE_Respon_Cell_Tech") 
    
    ID_Suiveur_Cell_Tech =  IntegerField("ID_Suiveur_Cell_Tech",
                        validators=[DataRequired(),validate_email])	

    POURCENTAGE_Suiveur_Cell_Tech = DecimalField("POURCENTAGE_Suiveur_Cell_Tech") 	

    ID_Respon_Cell_Planif =IntegerField("ID_Respon_Cell_Planif",
                        validators=[DataRequired(),validate_email])  

    POURCENTAGE_Respon_Cell_Planif = DecimalField("POURCENTAGE_Respon_Cell_Planif") 
    
    ID_Suiveur_Cell_Planif =  IntegerField("ID_Suiveur_Cell_Planif",
                        validators=[DataRequired(),validate_email])	

    POURCENTAGE_Suiveur_Cell_Planif	 = DecimalField("POURCENTAGE_Suiveur_Cell_Planif") 	

    ID_Agent_saisie_Cell_Planif =IntegerField("ID_Agent_saisie_Cell_Planif",
                        validators=[DataRequired(),validate_email])  	

    POURCENTAGE_Agent_saisie_CEll_planif = DecimalField("POURCENTAGE_Agent_saisie_CEll_planif") 

    misid =HiddenField()
    

    modifier = SubmitField('enregistre')


class Agenda_form(FlaskForm):

    Titre_du_Rdv=StringField("Titre du Rdv",
                        validators=[DataRequired()])

    Adresse1_Rdv=StringField("Address1 du Rdv",
                        validators=[DataRequired()])

    Adresse2_Rdv=StringField("Address2 du Rdv",
                        validators=[DataRequired()])

    Code_postal_Rdv=StringField("Code postal Rdv",
                        validators=[DataRequired()])
    
    Ville_du_Rdv=StringField("Ville du Rdv",
                    validators=[DataRequired()])
    
    Date_Rdv=StringField("Date Rdv",
                    validators=[DataRequired()])

    Heure_début_Rdv=StringField("Heure début Rdv",
                    validators=[DataRequired()])
    
    Heure_fin_Rdv=StringField("Heure fin Rdv",
                    validators=[DataRequired()])

    Date_Rdv_annulé=StringField("Date Rdv annulé",
                    validators=[DataRequired()])

    Informations_réservées_service_planification=StringField("Informations réservées service planification",
                                                 validators=[DataRequired()])

    Informations_générales=StringField("Informations générales",
                             validators=[DataRequired()])

    Informations_de_suivi_de_Rdv=StringField("Informations de suivi de Rdv",
                                    validators=[DataRequired()])

    Chemin_de_fichier_joint = StringField("Chemin de fichier joint",
                                    validators=[DataRequired()])
    
    submit = SubmitField('enregistrer')


class Invitation_Agenda(FlaskForm):

    Expert_invite=StringField("Expert invite",
                        validators=[DataRequired()])

    submit = SubmitField('enregistrer')

class Tarif_edit(FlaskForm):

    Type=StringField("Type",
                        render_kw={'readonly':True})

    prix=DecimalField("prix")
    
    tafid=HiddenField()

    surface=IntegerField("surface")

    submit = SubmitField('enregistrer')
class time(FlaskForm):

    Demarrer=DateField("Demarrer")


    submit = SubmitField('enregistrer')


class Tarif_Base(FlaskForm):

    maison_appartement=StringField("maison appartement",
                        validators=[DataRequired()])
    Nombre_de_piece=StringField("Nombre de piece",
                    validators=[DataRequired()])   
    Prix_EDL=DecimalField("Prix EDL",
                validators=[DataRequired()])
    Prix_Chiffrage=DecimalField("Prix_Chiffrage",
                validators=[DataRequired()])      
    submit = SubmitField('enregistrer')


class UpdateAccountForm(FlaskForm):
    username =StringField('UserName',
                                validators=[DataRequired(),length(min=4 ,max=20)])
    email =StringField('Email',
                           validators=[DataRequired(),Email()])
    picture = FileField('Update Profile Picture', validators=[FileAllowed(['jpg','png'])])
    submit = SubmitField('Update')
    
    def validate_username(self,username):
        if username.data != current_user.username:
            user = Expert.query.filter_by(Nom=username.data).first()

            if user:
                raise ValidationError('This username is taken.Please choose a different name')

    def validate_email(self,email):
        if email.data != current_user.email:
            user = Expert.query.filter_by(email=email.data).first()

            if user:
                raise ValidationError('This email is already used by  another user')