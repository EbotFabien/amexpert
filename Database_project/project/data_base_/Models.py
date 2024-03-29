from flask import current_app
from Database_project.project.data_base_ import  db,login_manager
from itsdangerous import  TimedJSONWebSignatureSerializer as Serializer
from datetime import datetime
from sqlalchemy import ForeignKeyConstraint,ForeignKey,UniqueConstraint
from flask_login import UserMixin
from sqlalchemy import Float
import json



@login_manager.user_loader
def load_user(user_id):
    return Expert.query.get(int(user_id))

class Client(db.Model):
    __table_args__ = {'extend_existing': True}


    __tablename__ = 'Client'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    reference = db.Column(db.Integer) 	
    TYPE = db.Column(db.String) 
    societe = db.Column(db.String) 	
    titre = db.Column(db.String) 	
    nom = db.Column(db.String)
    email = db.Column(db.String)
    numero = db.Column(db.String)
    siret=db.Column(db.String)
    date_creation =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)
  


    #def __init__(self,TYPE,societe,sexe,nom,email,numero,siret):
      #  self.TYPE=TYPE
      #  self.societe= societe
       # self.sexe = sexe
       # self.nom = nom
       # self.email=email
       # self.numero=numero
       # self.siret=siret
     

    def __repr__(self):
        return '<Client %r>' %self.id

class Expert(db.Model,UserMixin):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Expert'

    id = db.Column(db.Integer,primary_key=True)
    old= db.Column(db.String)
    new= db.Column(db.String)
    genre  = db.Column(db.String)	
    nom = db.Column(db.String)
    trigramme=db.Column(db.String)
    TYPE=db.Column(db.String)
    date_entree=db.Column(db.DateTime,default=datetime.utcnow)
    siret=db.Column(db.String) 
    email = db.Column(db.String)#unique
    email_perso = db.Column(db.String)
    numero = db.Column(db.String)
    code_tva=db.Column(db.String)
    taux_tva=db.Column(db.String)
    password = db.Column(db.String(60))
    visibility =db.Column(db.Boolean,default=True)
    
    


    def get_reset_token(self,expire_sec=1800):
        s = Serializer(current_app.config['SECRET_KEY'],expire_sec)
        return s.dumps({'expert_id':self.id}).decode('utf-8')

    @staticmethod
    def verify_reset_token(token):
        s = Serializer(current_app.config['SECRET_KEY'])
        try:
            expert_id = s.loads(token) ['expert_id']
        except:
            return None
        return Expert.query.get(expert_id)

    def __repr__(self):
        return '<Expert %r>' %self.id
        
class Client_History(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Client_History'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    client_id = db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   	
    adresse1  = db.Column(db.String)
    adresse2 = db.Column(db.String)
    etat_client=db.Column(db.Boolean,default=True)
    cp 	 = db.Column(db.String)
    ville  = db.Column(db.String)
    pays= db.Column(db.String)
    login_extranet= db.Column(db.String)
    mpd_extranet = db.Column(db.String)
    abonnement=db.Column(db.String)
    date =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


 #adresse2

        

    def __repr__(self):
        return '<Client_History %r>' %self.id

class Client_negotiateur(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Client_negotiateur'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    client_id = db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    client__nego=db.relationship("Client", 
            primaryjoin=(client_id == Client.id),
            backref=db.backref('client__nego',  uselist=False),  uselist=False)
    reference = db.Column(db.String) 	
    TYPE = db.Column(db.String) 
    societe = db.Column(db.String) 	
    sexe = db.Column(db.String) 	
    nom = db.Column(db.String)
    email = db.Column(db.String,unique=True)
    numero = db.Column(db.String)
    siret=db.Column(db.String)
    date_creation =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


    def __init__(self,client_id,TYPE,societe,sexe,nom,email,numero,siret):
        self.client_id=client_id
        self.TYPE=TYPE
        self.societe= societe
        self.sexe = sexe
        self.nom = nom
        self.email=email
        self.numero=numero
        self.siret=siret

    def __repr__(self):
        return '<Client_negotiateur %r>' %self.id

class Negotiateur_History(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Negotiateur_History'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    negotiateur_id = db.Column(db.Integer, ForeignKey('Client_negotiateur.id', onupdate="CASCADE", ondelete="CASCADE"))   	
    adresse  = db.Column(db.String)	
    etat_client=db.Column(db.Boolean,default=True)
    cp 	 = db.Column(db.String)
    ville  = db.Column(db.String)
    pays= db.Column(db.String)
    abonnement=db.Column(db.String)
    date =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


        

    def __repr__(self):
        return '<Negotiateur_History %r>' %self.id

class suivi_client(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'suivi_client'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    client = db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    suivi__data=db.relationship("Client", 
        primaryjoin=(client == Client.id),
        backref=db.backref('suivi__data',  uselist=False),  uselist=False)
    responsable=db.Column(db.Integer, db.ForeignKey('Expert.id'))
    responsable__data=db.relationship("Expert", 
        primaryjoin=(responsable == Expert.id),
        backref=db.backref('responsable__data',  uselist=False),  uselist=False)
    
    commentaire = db.Column(db.String)
    date_creation=db.Column(db.DateTime(),default=datetime.utcnow)
    date_modif=db.Column(db.DateTime())
    visibility=visibility =db.Column(db.Boolean,default=True)

    def __init__(self,client,responsable,commentaire):
        self.client=client
        self.responsable=responsable
        self.commentaire= commentaire


    def __repr__(self):
        return '<suivi_client %r>' %self.id

class prospect(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'prospect'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    reference = db.Column(db.String) 	
    TYPE = db.Column(db.String) 
    societe = db.Column(db.String) 	
    titre = db.Column(db.String) 	
    nom = db.Column(db.String)
    email = db.Column(db.String)
    numero = db.Column(db.String)
    siret=db.Column(db.String)
    date_creation =db.Column(db.DateTime,default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)
  


    def __init__(self,TYPE,societe,genre,nom,email,numero):
        self.TYPE=TYPE
        self.societe= societe
        self.genre = genre
        self.nom = nom
        self.email=email
        self.numero=numero
    

    def __repr__(self):
        return '<prospect %r>' %self.id


class prospect_History(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'prospect_History'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    prospect = db.Column(db.Integer, ForeignKey('prospect.id', onupdate="CASCADE", ondelete="CASCADE"))   		
    adresse  = db.Column(db.String)	
    cp 	 = db.Column(db.String)
    ville  = db.Column(db.String)
    pays= db.Column(db.String)
    etat_client=db.Column(db.String,default=True)
    date =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


    def __repr__(self):
        return '<prospect_History %r>' %self.id

class suivi_prospect(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'suivi_prospect'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    prospect_id = db.Column(db.Integer, ForeignKey('prospect.id', onupdate="CASCADE", ondelete="CASCADE"))   
    responsable=db.Column(db.Integer, db.ForeignKey('Expert.id'))
    suivi__data=db.relationship("prospect", 
        primaryjoin=(prospect_id == prospect.id),
        backref=db.backref('prospect__data',  uselist=False),  uselist=False)
    responsable__data=db.relationship("Expert", 
        primaryjoin=(responsable == Expert.id),
        backref=db.backref('responsable___data',  uselist=False),  uselist=False)
    commentaire = db.Column(db.String)
    date_creation=db.Column(db.DateTime(),default=datetime.utcnow)
    date_modif=db.Column(db.DateTime(),default=datetime.utcnow)
    visibility=db.Column(db.Boolean,default=True)

    def __init__(self,prospect,responsable,commentaire):
        self.prospect_id=prospect
        self.responsable=responsable
        self.commentaire= commentaire


    def __repr__(self):
        return '<suivi_prospect %r>' %self.id

class Facturation(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Facturation'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    Facture_no  = db.Column(db.Integer)
    Date_    = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    Pays  = db.Column(db.String)
    Destinataire  = db.Column(db.Integer, db.ForeignKey('Client.id'))
    expediteur  = db.Column(db.Integer, db.ForeignKey('Expert.id'))
    client_data_=db.relationship("Client", 
        primaryjoin=(Destinataire == Client.id),
        backref=db.backref('client_data_',  uselist=False),  uselist=False)

    Montant  = db.Column(db.String)
    TVA  = db.Column(db.String)
    Total  = db.Column(db.String)
    Type  = db.Column(db.String)
    Proprietaire  = db.Column(db.Integer, db.ForeignKey('Client.id'))
    Locataire   =db.Column(db.Integer, db.ForeignKey('Client.id'))
    Ville  = db.Column(db.String)
    Surface  = db.Column(db.String)
    Tarif  = db.Column(db.String)
    Appt_Pav  = db.Column(db.String)
    Visibility =db.Column(db.Boolean,default=True)
    

    def __init__(self,pays,des,exp,mont,total,Type,prop,locat,ville,surface,tarif,appt_pav):
        self.Pays =pays
        self.Destinataire =des
        self.expediteur =exp
        self.Montant =mont
        self.Total =total
        self.Type =Type
        self.Proprietaire =prop
        self.Locataire =locat
        self.Ville =ville
        self.Surface =surface
        self.Tarif =tarif
        self.Appt_Pav = appt_pav



    def __repr__(self):
        return '<Facturation %r>' %self.id





class Expert_History(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Expert_History'

    id = db.Column(db.Integer,primary_key=True)
    expert_id= db.Column(db.Integer, ForeignKey('Expert.id'))
    actif_parti=db.Column(db.String)
    secteur=db.Column(db.String)
    type_certification=db.Column(db.String)
    date_certification_initiale=db.Column(db.DateTime)
    date_renouv_certification=db.Column(db.DateTime)
    adresse1 = db.Column(db.String)
    adresse2 = db.Column(db.String)
    cp=db.Column(db.String)
    login_backof=db.Column(db.String)
    pwd_backof=db.Column(db.String) 
    login_extranet=db.Column(db.String)
    pwd_extranet=db.Column(db.String) 
    pwd_gsuite=db.Column(db.String)
    login_google=db.Column(db.String)
    pwd_google=db.Column(db.String)
    ville=db.Column(db.String)
    observations_de_suivi=db.Column(db.String)
    date_sortie=db.Column(db.DateTime)
    date=db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


    def __repr__(self):
        return '<Expert_History %r>' %self.id

class Agenda(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Agenda'

    id = db.Column(db.Integer,primary_key=True)
    Ref_agenda_date=db.Column(db.DateTime(),default=datetime.utcnow)
    client_id=db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE")) 
    client_data_=db.relationship("Client", 
        primaryjoin=(client_id == Client.id),
        backref=db.backref('_client_data_',  uselist=False),  uselist=False)

    Organisateur = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"))  
    Organisateur_data_=db.relationship("Expert", 
        primaryjoin=(Organisateur == Expert.id),
        backref=db.backref('Organisateur_data_',  uselist=False),  uselist=False)

    Titre_du_Rdv =db.Column(db.String)
    Adresse1_Rdv =db.Column(db.String)
    Adresse2_Rdv =db.Column(db.String)
    Code_postal_Rdv =db.Column(db.String)
    Ville_du_Rdv =db.Column(db.String)
    Date_Rdv =db.Column(db.String)
    Heure_début_Rdv =db.Column(db.String)
    Heure_fin_Rdv =db.Column(db.String)
    Date_Rdv_annulé =db.Column(db.String)
    Informations_reservees_service_planification =db.Column(db.String)
    Informations_generales =db.Column(db.String)
    Informations_de_suivi_de_Rdv =db.Column(db.String)
    Chemin_de_fichier_joint =db.Column(db.String)
    visibility =db.Column(db.Boolean,default=True)


    def __repr__(self):
        return '<Agenda %r>' %self.id

    

class Agenda_expert(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Agenda_expert'


    id = db.Column(db.Integer,primary_key=True)

    agenda_taken=db.Column(db.Integer, ForeignKey('Agenda.id', onupdate="CASCADE", ondelete="CASCADE")) 

    Participant_invité =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"))  

    validation = db.Column(db.Boolean,default=False)
 
    visibility =db.Column(db.Boolean,default=True)

    def __repr__(self):
        return '<Agenda_expert %r>' %self.id


class Tarif_base(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Tarif_base'

    id = db.Column(db.Integer,primary_key=True)
    pav_appartement=db.Column(db.String) 
    Type  = db.Column(db.String) 
    surface = db.Column(db.String) 
    Prix_EDL = db.Column(db.String) 
    visibility =db.Column(db.Boolean,default=True)

    def __repr__(self):
        return '<Tarif_base %r>' %self.id

class Tarifs(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Tarifs'

    id = db.Column(db.Integer,primary_key=True)
    reference_client= db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    
    data_client=db.relationship("Client", 
        primaryjoin=(reference_client == Client.id),
        backref=db.backref('data_client',  uselist=False),  uselist=False)
    edl_prix_std=db.Column(Float)     
    edl_appt_prix_f1=db.Column(Float) 
    edl_appt_prix_f2=db.Column(Float) 
    edl_appt_prix_f3=db.Column(Float) 
    edl_appt_prix_f4=db.Column(Float) 
    edl_appt_prix_f5=db.Column(Float) 
    edl_appt_prix_f6=db.Column(Float) 
    edl_pav_villa_prix_t1=db.Column(Float) 
    edl_pav_villa_prix_t2=db.Column(Float) 
    edl_pav_villa_prix_t3=db.Column(Float) 
    edl_pav_villa_prix_t4=db.Column(Float) 
    edl_pav_villa_prix_t5=db.Column(Float) 
    edl_pav_villa_prix_t6=db.Column(Float) 
    edl_pav_villa_prix_t7=db.Column(Float) 
    edl_pav_villa_prix_t8=db.Column(Float) 
    chif_appt_prix_stu=db.Column(Float) 
    chif_appt_prix_f1 =db.Column(Float) 
    chif_appt_prix_f2 =db.Column(Float) 
    chif_appt_prix_f3 =db.Column(Float) 
    chif_appt_prix_f4 =db.Column(Float) 
    chif_appt_prix_f5 =db.Column(Float) 
    chif_pav_villa_prix_t1=db.Column(Float) 
    chif_pav_villa_prix_t2=db.Column(Float) 
    chif_pav_villa_prix_t3=db.Column(Float) 
    chif_pav_villa_prix_t4=db.Column(Float) 
    chif_pav_villa_prix_t5=db.Column(Float) 
    chif_pav_villa_prix_t6=db.Column(Float) 
    chif_pav_villa_prix_t7=db.Column(Float) 
    chif_pav_villa_prix_t8=db.Column(Float) 
    code_tva=db.Column(db.String)
    taux_meuble=db.Column(db.String)
    referent_as_client=db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    referent__data=db.relationship("Expert", 
        primaryjoin=(referent_as_client == Expert.id),
        backref=db.backref('referent__data',  uselist=False),  uselist=False)

    com_as_sur_ca_client = db.Column(db.String)

    cell_dev_ref_responsable =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    cell_dev__data=db.relationship("Expert", 
        primaryjoin=(cell_dev_ref_responsable == Expert.id),
        backref=db.backref('cell_dev__data',  uselist=False),  uselist=False)

    com_cell_dev_ref_responsable = db.Column(db.String)

    cell_dev_ref_agent =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    cell_dev_ref_data=db.relationship("Expert", 
        primaryjoin=(cell_dev_ref_agent == Expert.id),
        backref=db.backref('cell_dev_ref_data',  uselist=False),  uselist=False)

    com_cell_dev_ref_agent = db.Column(db.String)
    
    cell_tech_ref_agent=db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    cell_tech_ref_agent__data=db.relationship("Expert", 
        primaryjoin=(cell_tech_ref_agent == Expert.id),
        backref=db.backref('cell_tech_ref_agent__data',  uselist=False),  uselist=False)

    com_cell_tech_Ref_agent = db.Column(db.String)

    cell_tech_ref_responsable =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    cell_tech_ref_responsable__data=db.relationship("Expert", 
        primaryjoin=(cell_tech_ref_responsable == Expert.id),
        backref=db.backref('cell_tech_ref_responsable__data',  uselist=False),  uselist=False)

    com_cell_tech_ref_responsable  = db.Column(db.String)

    cell_tech_ref_suiveur=db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    cell_tech_ref_suiveur__data=db.relationship("Expert", 
        primaryjoin=(cell_tech_ref_suiveur == Expert.id),
        backref=db.backref('cell_tech_ref_suiveur__data',  uselist=False),  uselist=False)
    com_cell_tech_ref_suiveur = db.Column(db.String)

    cell_planif_ref_responsable =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    cell_planif_ref_responsable_data=db.relationship("Expert", 
        primaryjoin=(cell_planif_ref_responsable  == Expert.id),
        backref=db.backref('cell_planif_ref_responsable_data',  uselist=False),  uselist=False)

    com_cell_planif_ref_responsable = db.Column(db.String)

    cell_planif_ref_suiveur =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    cell_planif_ref_suiveur__data=db.relationship("Expert", 
        primaryjoin=(cell_planif_ref_suiveur  == Expert.id),
        backref=db.backref('cell_planif_ref_suiveur__data',  uselist=False),  uselist=False)

    com_cell_planif_ref_suiveur = db.Column(db.String)

    cell_planif_ref_agent_saisie =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    cell_planif_ref_agent_saisie__data=db.relationship("Expert", 
        primaryjoin=(cell_planif_ref_agent_saisie  == Expert.id),
        backref=db.backref('cell_planif_ref_agent_saisie__data',  uselist=False),  uselist=False)

    com_cell_planif_ref_agent_saisie = db.Column(db.String)

    prix_autre= db.Column(db.String)
    commentaire_libre= db.Column(db.String)
    date=db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)
    
    


    def __repr__(self):
        return '<Tarifs %r>' %self.id





class Mission(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Mission'

    id = db.Column(db.Integer,primary_key=True)
    Reference_BAILLEUR	= db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    old= db.Column(db.String)
    Bailleur__data=db.relationship("Client", 
        primaryjoin=(Reference_BAILLEUR == Client.id),
        backref=db.backref('Bailleur__data',  uselist=False),  uselist=False)
    NRO_FACTURE	 = db.Column(db.String)
    ABONNEMENT	 = db.Column(db.String)
    ID_AS	 = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    AS__data=db.relationship("Expert", 
        primaryjoin=(ID_AS == Expert.id),
        backref=db.backref('CONCESS__data',  uselist=False),  uselist=False)
    PRIX_HT_EDL	 = db.Column(Float)  
    DATE_REALISE_EDL =db.Column(db.DateTime(),default=datetime.utcnow) 	
    ID_INTERV = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    INTERV__data=db.relationship("Expert", 
        primaryjoin=(ID_INTERV == Expert.id),
        backref=db.backref('INTERV__data',  uselist=False),  uselist=False)	
    Reference_LOCATAIRE	 =  db.Column(db.String) 
    Adresse1_Bien	 = db.Column(db.String)  
    Adresse2_Bien	 = db.Column(db.String) 
    CP_Bien	 = db.Column(db.String)  
    Ville_Bien	 = db.Column(db.String)  
      
    CA_HT_AS = db.Column(db.String) 	
    TVA_AS	 = db.Column(db.String) 
    CA_TTC_AS = db.Column(db.String) 	
    CA_HT_AC = db.Column(db.String) 	
    CA_TTC_AC	 = db.Column(db.String) 
    CA_HT_TRUST	 = db.Column(db.String) 
    TVA_TRUST	 = db.Column(db.String) 
    Date_chiffrage_regle = db.Column(db.String) 
    Prix_ht_chiffrage	 = db.Column(db.String) 
    POURCENTAGE_suiveur_chiffrage	 = db.Column(db.String) 
    POURCENTAGE_AS_chiffrage = db.Column(db.String) 	
    POURCENTAGE_manager_chiffrage  = db.Column(db.String) 	
    ID_manager_chiffrage  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True) 
    manager_chiffrage__data=db.relationship("Expert", 
        primaryjoin=(ID_manager_chiffrage == Expert.id),
        backref=db.backref('manager_chiffrage__data',  uselist=False),  uselist=False)	
    POURCENTAGE_agent_chiffrage = db.Column(db.String) 	
    ID_agent_chiffrage  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True) 	
    agent_chiffrage__data=db.relationship("Expert", 
        primaryjoin=(ID_agent_chiffrage == Expert.id),
        backref=db.backref('agent_chiffrage__data',  uselist=False),  uselist=False)
    TYPE_EDL = db.Column(db.String) 	
    DATE_FACTURE = db.Column(db.String) 
    TITREPROPRIO = db.Column(db.String) 		
    NOMPROPRIO = db.Column(db.String) 	
    DATE_FACT_REGLEE = db.Column(db.String) 	
    TYPE_LOGEMENT = db.Column(db.String) 	
    CODE_AMEXPERT = db.Column(db.String) 	
    COMMENTAIRE_FACTURE = db.Column(db.String) 	 	
    LOGEMENT_MEUBLE = db.Column(db.String) 	
    CODE_FACTURATION = db.Column(db.String) 	
    TYPE_DE_BIEN = db.Column(db.String) 	
    surface_logement1 = db.Column(db.String) 		
    Ref_commande = db.Column(db.String) 	
    POURCENTAGE_COM_AS_DU_CLIENT = db.Column(db.String) 	
    ID_Respon_Cell_Dev	 = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True) 
    Respon_Cell_Dev__data=db.relationship("Expert", 
        primaryjoin=(ID_Respon_Cell_Dev == Expert.id),
        backref=db.backref('Respon_Cell_Dev__data',  uselist=False),  uselist=False)
    POURCENTAGE_Respon_Cell_Dev = db.Column(db.String) 	
    ID_agent_Cell_Dev = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True) 	
    agent_Cell_Dev__data=db.relationship("Expert", 
        primaryjoin=(ID_agent_Cell_Dev == Expert.id),
        backref=db.backref('agent_Cell_Dev__data',  uselist=False),  uselist=False)
    POURCENTAGE_Agent_Cell_Dev = db.Column(db.String) 	
    ID_Agent_CellTech = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True)  	
    Agent_CellTech__data=db.relationship("Expert", 
        primaryjoin=(ID_Agent_CellTech == Expert.id),
        backref=db.backref('Agent_CellTech__data',  uselist=False),  uselist=False)
    POURCENTAGE_Agent_Cell_Tech = db.Column(db.String) 	
    ID_Respon_Cell_Tech = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True) #######
    Respon_Cell_Tech__data=db.relationship("Expert", 
        primaryjoin=(ID_Respon_Cell_Tech == Expert.id),
        backref=db.backref('Respon_Cell_Tech__data',  uselist=False),  uselist=False)	
    POURCENTAGE_Respon_Cell_Tech = db.Column(db.String) 	
    ID_Suiveur_Cell_Tech  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True) 
    Suiveur_Cell_Tech__data=db.relationship("Expert", 
        primaryjoin=(ID_Suiveur_Cell_Tech == Expert.id),
        backref=db.backref('Suiveur_Cell_Tech__data',  uselist=False),  uselist=False)
    POURCENTAGE_Suiveur_Cell_Tech	 = db.Column(db.String) 
    ID_Respon_Cell_Planif = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True) 
    Respon_Cell_Planif__data=db.relationship("Expert", 
        primaryjoin=(ID_Respon_Cell_Planif == Expert.id),
        backref=db.backref('Respon_Cell_Planif__data',  uselist=False),  uselist=False)
    POURCENTAGE_Respon_Cell_Planif  = db.Column(db.String) 	
    ID_Suiveur_Cell_Planif  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True) 
    Suiveur_Cell_Planif__data=db.relationship("Expert", 
        primaryjoin=(ID_Suiveur_Cell_Planif == Expert.id),
        backref=db.backref('Suiveur_Cell_Planif__data',  uselist=False),  uselist=False)
    POURCENTAGE_Suiveur_Cell_Planif	 = db.Column(db.String) 
    ID_Agent_saisie_Cell_Planif  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"), nullable=True)
    Agent_saisie_Cell_Planif__data=db.relationship("Expert", 
        primaryjoin=(ID_Agent_saisie_Cell_Planif == Expert.id),
        backref=db.backref('Agent_saisie_Cell_Planif__data',  uselist=False),  uselist=False)  	
    POURCENTAGE_Agent_saisie_CEll_planif  = db.Column(db.String) 

    Anomalie  = db.Column(db.Boolean,default=False)
    coherent  = db.Column(db.Boolean,default=True)
    reason = db.Column(db.String)
    Visibility =db.Column(db.Boolean,default=True)
    

    
    


    def __repr__(self):
        return '<Mission %r>' %self.id





class facturation_client(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'facturation_client'

    id = db.Column(db.Integer,primary_key=True)
    n_facture = db.Column(db.String)   
    Montant_HT = db.Column(db.String)
    client	= db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    client__data_=db.relationship("Client", 
        primaryjoin=(client == Client.id),
        backref=db.backref('client__data_',  uselist=False),  uselist=False)
    Date_de_creation=db.Column(db.DateTime(),default=datetime.utcnow)
    Date_mission=db.Column(db.DateTime())
    Date_reglement_client=db.Column(db.String)
    missions_s=db.Column(db.String)
    missions_f=db.Column(db.String)
    Statut=db.Column(db.String) #(payé ou en attente) differentes types de satus
    Observations_suivi_paiement=db.Column(db.String)
    Date_première_relance=db.Column(db.String) # date cree plus 15 jr
    Date_seconde_relance=db.Column(db.String) # date cree plus seconde relance plus 15 jr
    Date_mise_en_demeure=db.Column(db.String) # date seconde plus 15jr
    valide=db.Column(db.Boolean,default=False)
    visibility =db.Column(db.Boolean,default=True)
#valider=db.Column(db.Boolean,default=False)


    def __repr__(self):
        return '<facturation_client %r>' %self.id



class facturation_mission(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'facturation_mission'

    id = db.Column(db.Integer,primary_key=True)
    ref_mission = db.Column(db.Integer, ForeignKey('Mission.id', onupdate="CASCADE", ondelete="CASCADE")) 
    fact_mission = db.Column(db.Integer, ForeignKey('facturation_client.id', onupdate="CASCADE", ondelete="CASCADE"))
    mission__data_=db.relationship("Mission", 
        primaryjoin=(ref_mission == Mission.id),
        backref=db.backref('mission__data_',  uselist=False),  uselist=False)
    facturation_client__data_=db.relationship("facturation_client", 
        primaryjoin=(fact_mission == facturation_client.id),
        backref=db.backref('facturation_client__data_',  uselist=False),  uselist=False)
    
    visibility =db.Column(db.Boolean,default=True)

    def __repr__(self):
        return '<facturation_mission %r>' %self.id






class Facturation_history(db.Model):
    __table_args__ = {'extend_existing': True}

    __tablename__ = 'Facturation_history'

    id = db.Column(db.Integer,primary_key=True)
    date=db.Column(db.DateTime())
    mission = db.Column(db.Integer, ForeignKey('Mission.id', onupdate="CASCADE", ondelete="CASCADE"))
    facture = db.Column(db.Integer, ForeignKey('facturation_client.id', onupdate="CASCADE", ondelete="CASCADE"))
    mission__data=db.relationship("Mission", 
        primaryjoin=(mission == Mission.id),
        backref=db.backref('mission__data',  uselist=False),  uselist=False)
    facturation_client__data=db.relationship("facturation_client", 
        primaryjoin=(facture == facturation_client.id),
        backref=db.backref('facturation_client__data',  uselist=False),  uselist=False)
    done=db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


    def __repr__(self):
        return '<Facturation_history %r>' %self.id


    