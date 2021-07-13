from flask_wtf import FlaskForm,RecaptchaField, Recaptcha
from flask_wtf.file import FileField, FileAllowed
from flask_login import current_user
from wtforms import StringField,PasswordField,SubmitField,BooleanField,SelectField, IntegerField, TextAreaField,HiddenField
from wtforms.validators import DataRequired,length,Email,EqualTo,ValidationError,Optional
from project.data_base_.Models import Expert ,Client,Tarif_base,Client_negotiateur
from wtforms.fields.html5 import DateField
from sqlalchemy import or_, and_, desc,asc




class RegistrationForm(FlaskForm):
    username =StringField("Identifiant",
                                validators=[DataRequired(),length(min=4 ,max=20)])
    
    Numero =StringField('Tel',
                                validators=[DataRequired(),length(min=4 ,max=20)])

    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])

    password =PasswordField('Mot de pass',
                                  validators=[length(min=8 ,max=20)])
    confirm_password =PasswordField('Confirmer le mot de pass',
                                  validators=[EqualTo('password')])

    Type_Expert=SelectField('Type d\'expert',
                             choices=[('Interv', 'Interv'), ('CONCESS', 'CONCESS'), ('agent Cell Dev', 'agent Cell Dev'),('Interv', 'Interv'),('Suiveur Cell Tech', 'Suiveur Cell Tech'),('Suiveur Cell Planif', 'Suiveur Cell Planif'),('Admin', 'Admin'),('Audit', 'Audit')])

    Sexe=SelectField('Sexe',
                             choices=[('MME', 'MME'), ('M.', 'M.')])

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')
    
    def validate_username(self,username): 
        user = Expert.query.filter_by(nom=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    def validate_email(self,email):
        email = Expert.query.filter_by(email=email.data).first()

        if email:
            raise ValidationError('Cet e-mail est déjà utilisé par un autre utilisateur')


class Expert_editForm(FlaskForm):
    username =StringField("Identifiant",
                                validators=[DataRequired(),length(min=4 ,max=20)])
    
    Numero =StringField('Tel',
                                validators=[DataRequired(),length(min=4 ,max=20)])

    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])

    email_perso =StringField('E-mail perso', validators=[DataRequired(),Email()])


    Sexe=SelectField('Genre',
                             choices=[('MME', 'MME'), ('M.', 'M.')])


    Type =StringField('Type',  validators=[DataRequired()])

    secteur =StringField('Secteur', validators=[DataRequired()])


    siret =StringField('siret',
                                  validators=[DataRequired()])

    trigramme =StringField('trigramme',
                                validators=[DataRequired()])

    code_tva =StringField('Code tva',
                            validators=[DataRequired()])
                        
    taux_tva =StringField('Taux tva',
                            validators=[DataRequired()])

    actif_parti =StringField('Actif parti',
                            validators=[DataRequired()])

    ville =StringField('Ville',
                        validators=[DataRequired()])
    
    type_certification=StringField('Type certification',
                        validators=[DataRequired()])
    date_certification=DateField('Date de certification', validators=[DataRequired()])
    date_certification_renouv=DateField('Date de recertification', validators=[DataRequired()])
    
    date_entree=StringField('Date de entree',render_kw={'readonly':True})


    mdp=DateField('Date de sortie')

    adresse=StringField('Adresse 1',
                        validators=[DataRequired()])

    adresse2=StringField('Adresse 2',
                        validators=[DataRequired()])

    cp=StringField('CP',
                        validators=[DataRequired()])
    login_google=StringField('login google',
                        validators=[DataRequired()])
    pwd_google=StringField('Pwd google',
                        validators=[DataRequired()])
    login_backof=StringField('login_backof',
                        validators=[DataRequired()])
    pwd_backof=StringField('pwd_backof',
                        validators=[DataRequired()]) #endeavour to hash all passwords
    login_extranet=StringField('login_extranet',
                        validators=[DataRequired()])
    pwd_extranet=StringField('pwd_extranet',
                        validators=[DataRequired()])
    pwd_gsuite=StringField('pwd_gsuite',
                        validators=[DataRequired()])
    observations_de_suivi=StringField('observations_de_suivi',
                        validators=[DataRequired()])

    modifier = SubmitField('modifier')

class RequestResetForm(FlaskForm):
    email =StringField('Email',
                           validators=[DataRequired(),Email()])
    submit = SubmitField('Request Password Reset')

    recaptcha = RecaptchaField(validators=[Recaptcha(message="Le reCAPTCHA n'a pas été saisi correctement. Revenez en arrière et essayez à nouveau.")])

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
    def validate_price_STD(self,edl_prix_std): 
            base = Tarif_base.query.filter(and_(Tarif_base.pav_appartement=='APPT',Tarif_base.Type=='STD')).first()
            if edl_prix_std.data == 0:
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

    edl_prix_std=IntegerField('edl_prix_std', validators=[DataRequired(),validate_price_STD])     
    edl_appt_prix_f1=IntegerField('edl_appt_prix_f1', validators=[DataRequired(),validate_price_F1])
    edl_appt_prix_f2=IntegerField('edl_appt_prix_f2', validators=[DataRequired(),validate_price_F2]) 
    edl_appt_prix_f3=IntegerField('edl_appt_prix_f3', validators=[DataRequired(),validate_price_F3])
    edl_appt_prix_f4=IntegerField('edl_appt_prix_f4', validators=[DataRequired(),validate_price_F4]) 
    edl_appt_prix_f5=IntegerField('edl_appt_prix_f5', validators=[DataRequired(),validate_price_F5])
    edl_appt_prix_f6=IntegerField('edl_appt_prix_f6', validators=[DataRequired(),validate_price_F6])
    edl_pav_villa_prix_t1=IntegerField('edl_pav_villa_prix_t1', validators=[DataRequired(),validate_price_T1])
    edl_pav_villa_prix_t2=IntegerField('edl_pav_villa_prix_t2', validators=[DataRequired(),validate_price_T2])
    edl_pav_villa_prix_t3=IntegerField('edl_pav_villa_prix_t3', validators=[DataRequired(),validate_price_T3])
    edl_pav_villa_prix_t4=IntegerField('edl_pav_villa_prix_t4', validators=[DataRequired(),validate_price_T4]) 
    edl_pav_villa_prix_t5=IntegerField('edl_pav_villa_prix_t5', validators=[DataRequired(),validate_price_T5])
    edl_pav_villa_prix_t6=IntegerField('edl_pav_villa_prix_t6', validators=[DataRequired(),validate_price_T6])
    edl_pav_villa_prix_t7=IntegerField('edl_pav_villa_prix_t7', validators=[DataRequired(),validate_price_T7]) 
    edl_pav_villa_prix_t8=IntegerField('edl_pav_villa_prix_t8', validators=[DataRequired(),validate_price_T8])
    chif_appt_prix_stu=IntegerField('chif_appt_prix_stu', validators=[DataRequired(),validate_chif_STD])
    chif_appt_prix_f1 =IntegerField('chif_appt_prix_f1', validators=[DataRequired(),validate_chif_F1]) 
    chif_appt_prix_f2 =IntegerField('chif_appt_prix_f2', validators=[DataRequired(),validate_chif_F2]) 
    chif_appt_prix_f3 =IntegerField('chif_appt_prix_f3', validators=[DataRequired(),validate_chif_F3]) 
    chif_appt_prix_f4 =IntegerField('chif_appt_prix_f4', validators=[DataRequired(),validate_chif_F4]) 
    chif_appt_prix_f5 =IntegerField('chif_appt_prix_f5', validators=[DataRequired(),validate_chif_F5]) 
    chif_appt_prix_f6 =IntegerField('chif_appt_prix_f6', validators=[DataRequired(),validate_chif_F6]) 
    chif_pav_villa_prix_t1=IntegerField('chif_pav_villa_prix_t1', validators=[DataRequired(),validate_chif_T1])
    chif_pav_villa_prix_t2=IntegerField('chif_pav_villa_prix_t2', validators=[DataRequired(),validate_chif_T2]) 
    chif_pav_villa_prix_t3=IntegerField('chif_pav_villa_prix_t3', validators=[DataRequired(),validate_chif_T3])
    chif_pav_villa_prix_t4=IntegerField('chif_pav_villa_prix_t4', validators=[DataRequired(),validate_chif_T4])
    chif_pav_villa_prix_t5=IntegerField('chif_pav_villa_prix_t5', validators=[DataRequired(),validate_chif_T5])
    chif_pav_villa_prix_t6=IntegerField('chif_pav_villa_prix_t6', validators=[DataRequired(),validate_chif_T6])
    chif_pav_villa_prix_t7=IntegerField('chif_pav_villa_prix_t7', validators=[DataRequired(),validate_chif_T7]) 
    chif_pav_villa_prix_t8=IntegerField('chif_pav_villa_prix_t8', validators=[DataRequired(),validate_chif_T8])
    prix_autre=IntegerField('prix_autre', validators=[Optional()])

    code_tva= StringField('code tva', validators=[Optional()])

    taux_meuble= StringField('taux_meuble', validators=[Optional()])

    referent_as_client= StringField('referent_as_client', validators=[DataRequired()])

    com_as_sur_ca_client=StringField('com_as_sur_ca_client', validators=[DataRequired()])

    cell_dev_ref_responsable = StringField('cell_dev_ref_responsable', validators=[DataRequired()])

    com_cell_dev_ref_responsable = StringField('com_cell_dev_ref_responsable', validators=[DataRequired()])

    cell_dev_ref_agent = StringField('cell_dev_ref_agent', validators=[DataRequired()])

    com_cell_dev_ref_agent = StringField('com_cell_dev_ref_agent', validators=[DataRequired()])

    cell_tech_ref_agent = StringField('cell_tech_ref_agent', validators=[DataRequired()])

    com_cell_tech_Ref_agent = StringField('com_cell_tech_Ref_agent', validators=[DataRequired()])

    cell_tech_ref_responsable  = StringField('cell_tech_ref_responsable', validators=[DataRequired()])

    com_cell_tech_ref_responsable = StringField('com_cell_tech_ref_responsable', validators=[DataRequired()])

    cell_tech_ref_suiveur = StringField('cell_tech_ref_suiveur', validators=[DataRequired()])

    com_cell_tech_ref_suiveur  = StringField('com_cell_tech_ref_suiveur', validators=[DataRequired()])

    cell_planif_ref_responsable = StringField('cell_planif_ref_responsable', validators=[DataRequired()])

    com_cell_planif_ref_responsable = StringField('com_cell_planif_ref_responsable', validators=[DataRequired()])

    cell_planif_ref_suiveur = StringField('cell_planif_ref_suiveur', validators=[DataRequired()])

    com_cell_planif_ref_suiveur  =  StringField('com_cell_planif_ref_suiveur', validators=[DataRequired()])

    cell_planif_ref_agent_saisie  =  StringField('cell_planif_ref_agent_saisie', validators=[DataRequired()])

    com_cell_planif_ref_agent_saisie  =  StringField('com_cell_planif_ref_agent_saisie', validators=[DataRequired()])

    commentaire_libre = TextAreaField('commentaire_libre', validators=[Optional()])
    
    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')

    
    
   


class Facturation_Form(FlaskForm):
    Reference_client=StringField('Reference client',
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
                           validators=[DataRequired()])

    Adresse1=StringField('Adresse1 ',
                           validators=[DataRequired()])
    
    Adresse2=StringField('Adresse2 ',
                           validators=[DataRequired()])

    CP=StringField('Code Postal',
                           validators=[DataRequired()])
    
    Ville=StringField('Ville',
                           validators=[DataRequired()])
    
    Siret=StringField("Siret N°",
                           validators=[DataRequired()])

    Pays=SelectField("Pays ", choices=[('France', 'France'), ('Belgique', 'Belgique')],
                        validators=[DataRequired()])

    Reference=StringField("Reference",
                           validators=[DataRequired()])
    
    Date_Creation=StringField("Date_Creation",
                           render_kw={'readonly':True})

    EtatClient=StringField("Etat du client")
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


class Negotiateur_Form(FlaskForm):
       

    Sexe=SelectField('Titre',
                             choices=[('Monsieur', 'Monsieur',), ('Madame', 'Madame'), ('Mademoiselle', 'Mademoiselle')])

    NOM =StringField('Nom et prénom',
                           validators=[DataRequired()])
    
    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])

    Numero =StringField('Tel',
                           validators=[DataRequired()])

    Adresse=StringField('Adresse ',
                           validators=[DataRequired()])

    CP=StringField('Code Postal',
                           validators=[DataRequired()])
    
    Ville=StringField('Ville',
                           validators=[DataRequired()])
    

    Pays=SelectField("Pays ", choices=[('France', 'France'), ('Belgique', 'Belgique')],
                        validators=[DataRequired()])

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

    commentaire=StringField("commentaire",
                        validators=[DataRequired()])
    submit = SubmitField('enregistrer')


class Mission_add(FlaskForm):

    Reference_client=StringField("N° Client",
                        validators=[DataRequired()])

    ID_Concessionaire=StringField("N° Concessionaire",
                        validators=[DataRequired()])
   
    submit = SubmitField('enregistrer')


class Mission_editForm(FlaskForm):

  
    TYPE_LOGEMENT =  StringField("TYPE LOGEMENT",
                        validators=[DataRequired()])	

    LOGEMENT_MEUBLE = StringField("LOGEMENT MEUBLE",
                        validators=[DataRequired()]) 	
    CODE_FACTURATION =StringField("CODE FACTURATION",
                        validators=[DataRequired()])  	
    TYPE_DE_BIEN = StringField("TYPE DE BIEN",
                        validators=[DataRequired()]) 	

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

    prix=StringField("prix",
                        validators=[DataRequired()])

    surface=StringField("surface",
                        validators=[DataRequired()])

    submit = SubmitField('enregistrer')
class time(FlaskForm):

    Demarrer=DateField("Demarrer")


    submit = SubmitField('enregistrer')


class Tarif_Base(FlaskForm):

    maison_appartement=StringField("maison appartement",
                        validators=[DataRequired()])
    Nombre_de_piece=StringField("Nombre de piece",
                    validators=[DataRequired()])   
    Prix_EDL=StringField("Prix EDL",
                validators=[DataRequired()])
    Prix_Chiffrage=StringField("Prix EDL",
                validators=[DataRequired()])      
    submit = SubmitField('enregistrer')