from Database_project.project.data_base_ import db
from Database_project.project.data_base_.Models import Tarifs,Mission,Client,Expert,Client_History,prospect,prospect_History,Expert_History,Tarif_base
import xlrd
import openpyxl
import pandas

def insert_client(A,loc):
    
    wb_obj = openpyxl.load_workbook(loc)
    sheet=wb_obj.active

    

    for i in range(1,sheet.max_row):
        
        if A == 'professionelle':
            
            if sheet["D"][i].value == '' or sheet["D"][i].value == 'XX':
                print('no data here')
            else:
                
                cli=Client.query.filter_by(reference=int(sheet["A"][i].value)).first()
                if cli is None:
                    client=Client(reference=int(sheet["A"][i].value),TYPE=A,societe=sheet["B"][i].value,titre=sheet["C"][i].value,nom=sheet["D"][i].value.lower(),date_creation=sheet["K"][i].value)
                    db.session.add(client)
                    db.session.commit()   
                    history=Client_History(client_id=client.id,adresse1=sheet["E"][i].value,adresse2=sheet["F"][i].value,cp=sheet["G"][i].value,ville=sheet["H"][i].value,login_extranet=sheet["M"][i].value,mpd_extranet=sheet["N"][i].value)
                    db.session.add(history)
                    db.session.commit()
                    if sheet["L"][i].value != None :
                        history.date=sheet["L"][i].value
                        db.session.commit()

                else:
                    print('already exist')

        
#to be fixed

def expert__(loc):

    wb_obj = openpyxl.load_workbook(loc)
    sheet=wb_obj.active

    
    for i in range(1,sheet.max_row):
        
        
  
        cli=Expert.query.filter_by(nom=str(sheet["D"][i].value.lower())).first()
    
        if cli is None:
            expert=Expert(genre='M',old=sheet["A"][i].value,nom=sheet["D"][i].value.lower(),numero=sheet["R"][i].value,TYPE=sheet["B"][i].value,
            email=sheet["S"][i].value,email_perso=sheet["T"][i].value,code_tva=sheet["P"][i].value,taux_tva=sheet["Q"][i].value,siret=sheet["K"][i].value,date_entree=sheet["F"][i].value,
            trigramme=sheet["E"][i].value)    
            db.session.add(expert)
            db.session.commit()
            #expert.new="Expert"+str(expert.id)
            #db.session.commit()
            history=Expert_History(expert_id=expert.id,secteur=sheet["C"][i].value,adresse1=sheet["L"][i].value,adresse2=sheet["M"][i].value,cp=sheet["N"][i].value,
            ville=sheet["O"][i].value,login_backof=sheet["U"][i].value,pwd_backof=sheet["V"][i].value,login_extranet=sheet["Y"][i].value,
            pwd_extranet=sheet["Z"][i].value,login_google=sheet["AA"][i].value,pwd_google=sheet["AB"][i].value,observations_de_suivi=sheet["AE"][i].value)
            db.session.add(history)
            db.session.commit()
        else:
            print('already exist')
#talk about date sortie(Format)
        

def tarif_client(loc):
    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)

    sheet.cell_value(0, 0)
    for i in range(0,4):
        name=sheet.row_values(i+1)
        tarif =Tarifs.query.filter_by(reference_client=int(name[1])).first()
        cli=Client.query.filter_by(reference=int(name[1])).first()
        if tarif is None:
            if cli :
                taf_base =Tarifs(reference_client=cli.id,code_tva=int(name[2]),
                referent_as_client=int(name[3]),com_as_sur_ca_client=name[4],cell_dev_ref_responsable=name[5],
                com_cell_dev_ref_responsable=name[6],cell_dev_ref_agent=int(name[7]),com_cell_dev_ref_agent=name[8],
                cell_tech_ref_agent=int(name[9]),com_cell_tech_Ref_agent=name[10],cell_tech_ref_responsable=int(name[11]),
                com_cell_tech_ref_responsable=name[12],cell_tech_ref_suiveur=int(name[13]),
                com_cell_tech_ref_suiveur=name[14],cell_planif_ref_responsable=int(name[15]),
                com_cell_planif_ref_responsable=name[16],cell_planif_ref_suiveur=int(name[17]),
                com_cell_planif_ref_suiveur=name[18],cell_planif_ref_agent_saisie=int(name[19]),
                com_cell_planif_ref_agent_saisie=name[20],taux_meuble=name[21],edl_prix_std=float(name[22]),
                edl_appt_prix_f1=float(name[23]),edl_appt_prix_f2=float(name[24]),edl_appt_prix_f3=float(name[25]),edl_appt_prix_f4=float(name[26]),
                edl_appt_prix_f5=float(name[27]),edl_appt_prix_f6=float(name[28]),edl_pav_villa_prix_t1=float(name[29]), edl_pav_villa_prix_t2=float(name[30]),
                edl_pav_villa_prix_t3=float(name[31]),edl_pav_villa_prix_t4=float(name[32]),edl_pav_villa_prix_t5=float(name[33]),edl_pav_villa_prix_t6=float(name[34]),
                edl_pav_villa_prix_t7=float(name[35]),edl_pav_villa_prix_t8=float(name[36]),chif_appt_prix_stu=float(name[37]),
                chif_appt_prix_f1=float(name[38]),chif_appt_prix_f2=float(name[39]),chif_appt_prix_f3=float(name[40]),
                chif_appt_prix_f4=float(name[41]),chif_appt_prix_f5=float(name[42]),chif_pav_villa_prix_t1=float(name[43]),
                chif_pav_villa_prix_t2=float(name[44]),chif_pav_villa_prix_t3=float(name[45]),chif_pav_villa_prix_t4=float(name[46]),
                chif_pav_villa_prix_t5=float(name[47]),chif_pav_villa_prix_t6=float(name[48]),chif_pav_villa_prix_t7=float(name[49]),
                chif_pav_villa_prix_t8=float(name[50]))
                
                db.session.add(taf_base)
                db.session.commit()
            else:
                print('esit2')
        else:
            print('esit')

def Missions(loc):
    
    wb_obj = openpyxl.load_workbook(loc)
    sheet=wb_obj.active
    
    reference=[]
    
    for i in range(1,sheet.max_row):
        
        cli=Client.query.filter_by(reference=int(sheet["B"][i].value)).first()
        AS=Expert.query.filter_by(nom=str(sheet["E"][i].value.lower())).first()
        if AS is not None:
            SA= AS.id
        if AS is None :
            SA= 0

        INTERV=Expert.query.filter_by(nom=str(sheet["H"][i].value.lower())).first()
        if INTERV is not None:
            IV= INTERV.id
        if INTERV is None  :
            IV= 0

        M_C=Expert.query.filter_by(nom=str(sheet["Z"][i].value.lower())).first()
        if M_C is not None:
            MC= M_C.id
        if M_C is None  :
            MC= 0

        A_C=Expert.query.filter_by(nom=str(sheet["AB"][i].value.lower())).first()
        if A_C is not None:
            AC= A_C.id
        if A_C is None  :
            AC= 0

        if sheet["AQ"][i].value is None:
            RCD=0
        else:
            R_CD=Expert.query.filter_by(nom=str(sheet["AQ"][i].value.lower())).first()
            if R_CD is not None:
                RCD= R_CD.id
            if R_CD is None  :
                RCD= 0

        if sheet["AS"][i].value is None:
            ACD=0
        else:
            A_CD=Expert.query.filter_by(nom=str(sheet["AS"][i].value.lower())).first()
            if A_CD is not None:
                ACD= A_CD.id
            if A_CD is None  :
                ACD= 0

        if sheet["AU"][i].value is None:
            ACT=0
        else:
            A_CT=Expert.query.filter_by(nom=str(sheet["AU"][i].value.lower())).first()
            if A_CT is not None:
                ACT= A_CT.id
            if A_CT is None  :
                ACT= 0

        if sheet["AW"][i].value is None:
            RCT=0
        else:
            R_CT=Expert.query.filter_by(nom=str(sheet["AW"][i].value.lower())).first()
            if R_CT is not None:
                RCT= R_CT.id
            if R_CT is None  :
                RCT= 0

        if sheet["AY"][i].value is None:
            SCT=0
        else:
            S_CT=Expert.query.filter_by(nom=str(sheet["AY"][i].value.lower())).first()
            if S_CT is not None:
                SCT= S_CT.id
            if S_CT is None  :
                SCT= 0

        if sheet["BA"][i].value is None:
            RCP=0
        else:
            R_CP=Expert.query.filter_by(nom=str(sheet["BA"][i].value.lower())).first()
            if R_CP is not None:
                RCP= R_CP.id
            if R_CP is None  :
                RCP= 0

        if sheet["BC"][i].value is None:
            SCP=0
        else:
            S_CP=Expert.query.filter_by(nom=str(sheet["BC"][i].value.lower())).first()
            if S_CP is not None:
                SCP= S_CP.id
            if S_CP is None  :
                SCP= 0

        if sheet["BE"][i].value is None:
            ASCP=0
        else:
            AS_CP=Expert.query.filter_by(nom=str(sheet["BE"][i].value.lower())).first()
            if AS_CP is not None:
                ASCP= AS_CP.id
            if AS_CP is None  :
                ASCP= 0

        if cli:
            mission=Mission(Reference_BAILLEUR=cli.id,
            old=sheet["A"][i].value,
            ABONNEMENT	 = sheet["D"][i].value ,
            ID_AS	 = SA ,
        
          
            DATE_REALISE_EDL =sheet["G"][i].value , 	
            ID_INTERV = IV ,
            
            Reference_LOCATAIRE	 =  sheet["I"][i].value ,
            Adresse1_Bien	 = sheet["J"][i].value ,  
            Adresse2_Bien	 = sheet["K"][i].value , 
            CP_Bien	 = sheet["L"][i].value ,  
            Ville_Bien	 = sheet["M"][i].value , 
            
            CA_HT_AS = sheet["N"][i].value , 	
            TVA_AS	 = sheet["O"][i].value , 
            CA_TTC_AS = sheet["P"][i].value , 	
            CA_HT_AC = sheet["Q"][i].value , 	
            CA_TTC_AC	 = sheet["R"][i].value , 
            CA_HT_TRUST	 = sheet["S"][i].value , 
            TVA_TRUST	 = sheet["T"][i].value ,
            Prix_ht_chiffrage	 = sheet["V"][i].value , 
            POURCENTAGE_suiveur_chiffrage	 = sheet["W"][i].value ,
            POURCENTAGE_AS_chiffrage = sheet["X"][i].value ,	
            POURCENTAGE_manager_chiffrage  = sheet["Y"][i].value , 	
            ID_manager_chiffrage  = MC ,
                
            POURCENTAGE_agent_chiffrage = sheet["AA"][i].value ,	
            ID_agent_chiffrage  = AC ,	
            
            TYPE_EDL = sheet["AC"][i].value ,	
            TITREPROPRIO = sheet["AE"][i].value , 		
            NOMPROPRIO = sheet["AF"][i].value , 	
           # DATE_FACT_REGLEE = sheet["AG"][i].value ,	
            TYPE_LOGEMENT = sheet["AH"][i].value , 	
            CODE_AMEXPERT = sheet["AI"][i].value , 	
            #COMMENTAIRE_FACTURE = sheet["AJ"][i].value , 	
            LOGEMENT_MEUBLE =sheet["AK"][i].value , 	
            CODE_FACTURATION = sheet["AL"][i].value , 	
            TYPE_DE_BIEN = sheet["AM"][i].value , 	
            surface_logement1 = sheet["AN"][i].value , 		
            Ref_commande = sheet["AO"][i].value , 	
            POURCENTAGE_COM_AS_DU_CLIENT = sheet["AP"][i].value , 	
            ID_Respon_Cell_Dev	 =RCD ,
            
            POURCENTAGE_Respon_Cell_Dev = sheet["AR"][i].value , 	
            ID_agent_Cell_Dev = ACD, 	
            
            POURCENTAGE_Agent_Cell_Dev = sheet["AT"][i].value ,	
            ID_Agent_CellTech = ACT,  	
            
            POURCENTAGE_Agent_Cell_Tech = sheet["AV"][i].value , 	
            ID_Respon_Cell_Tech = RCT, #######
                
            POURCENTAGE_Respon_Cell_Tech = sheet["AX"][i].value ,	
            ID_Suiveur_Cell_Tech  = SCT ,
            
            POURCENTAGE_Suiveur_Cell_Tech	 = sheet["AZ"][i].value , 
            ID_Respon_Cell_Planif = RCP,
            
            POURCENTAGE_Respon_Cell_Planif  = sheet["BB"][i].value ,
            ID_Suiveur_Cell_Planif  = SCP,
            
            POURCENTAGE_Suiveur_Cell_Planif	 = sheet["BD"][i].value , 
            ID_Agent_saisie_Cell_Planif  = ASCP,
                
            POURCENTAGE_Agent_saisie_CEll_planif  = sheet["BF"][i].value )

            db.session.add(mission)
            db.session.commit()
        else:
            reference.append(int(sheet["B"][i].value))# make a table for historique des donnees 
            print(reference)
        

def fix_mission():
    mission=Mission.query.all()
    for i in mission:
        if i.CODE_FACTURATION[-1]=='M':
            print(i.CODE_FACTURATION)
            i.CODE_FACTURATION[2:5] == 150
            A=i.CODE_FACTURATION[0:-1]
            i.CODE_FACTURATION = A
            print(i.CODE_FACTURATION)
            db.session.commit()

        if i.CODE_FACTURATION[-1] == ' ':
            print( i.CODE_FACTURATION)
            B=i.CODE_FACTURATION[0:-1] 
            i.CODE_FACTURATION = B
            db.session.commit()
        
        
        if i.TYPE_LOGEMENT[-1] == ' ':
            print( i.TYPE_LOGEMENT)
            B=i.TYPE_LOGEMENT[0:-1] 
            i.TYPE_LOGEMENT = B
            db.session.commit()


        if i.TYPE_LOGEMENT[-1] == 'M':
            print(i.TYPE_LOGEMENT)
            i.CODE_FACTURATION[2:5] == 150
            print(i.CODE_FACTURATION)
            B=i.TYPE_LOGEMENT[0:-1] 
            i.TYPE_LOGEMENT = B
            print(i.TYPE_LOGEMENT)
            db.session.commit()

        if i.TYPE_LOGEMENT[-2:] != i.CODE_FACTURATION[-2:]  :
            i.Anomalie = True
            i.reason = "Anomalie non bloquante traite en  "+str(i.TYPE_LOGEMENT[-2:])
            db.session.commit()

        if i.CODE_FACTURATION[-2:] == "00" or  i.CODE_FACTURATION[-2:] == "50" :
            i.Anomalie = False
            i.reason = None
            db.session.commit()

        if len(i.TYPE_LOGEMENT[0:4]) < 3 :
            if len(i.TYPE_LOGEMENT[0:2]) == 2:
                if i.TYPE_LOGEMENT[0] == "T":
                    B="PAV-"+str(i.TYPE_LOGEMENT) 
                    i.TYPE_LOGEMENT = B
                    db.session.commit()
                if i.TYPE_LOGEMENT[0] == "F":
                    B="APPT-"+str(i.TYPE_LOGEMENT)
                    i.TYPE_LOGEMENT = B
                    db.session.commit() 
            else:
                i.coherent = False 
                i.reason = "Anomalie bloquante codification du type de logement incorrect sur  "+str(i.TYPE_LOGEMENT)
                db.session.commit()
        


def reset():
    mission=Mission.query.delete()
    db.session.commit()
    #for i in mission:
        #i.NRO_FACTURE = None
       # db.session.commit()
       # print('o')

def Base(loc):
    wb_obj = openpyxl.load_workbook(loc)
    sheet=wb_obj.active
    A=['F','G','H','I','J','K','L']

    for i in A:
        base_appt=Tarif_base(pav_appartement='APPT',Type=sheet[i][24].value,surface=sheet[i][25].value,Prix_EDL=sheet[i][26].value)
        base_pav=Tarif_base(pav_appartement='PAV',Type=sheet[i][28].value,surface=sheet[i][29].value,Prix_EDL=sheet[i][30].value)
        if sheet[i][28].value == 'T2':
            base_pav1=Tarif_base(pav_appartement='PAV',Type='T1',surface=0,Prix_EDL=0)
            db.session.add(base_pav1)
            db.session.commit()
        db.session.add(base_appt)
        db.session.add(base_pav)
        db.session.commit()
        
    

































#Missions()






#insert_client('Bailleur')
#insert_client('Locataire')
#insert_client('Prop')
#expert_('Interv')
#expert_('CONCESS')
#expert_('Manager_chiffrage')
#expert_('Agent_chiffrage')
#expert_('Respon Cell Dev')
#expert_('agent Cell Dev')
#expert_('Agent CellTech')
#expert_('Respon Cell Tech')
#expert_('Suiveur Cell Tech')
#expert_('Respon Cell Planif')
#expert_('Suiveur Cell Planif')
#expert_('Agent saisie Cell Planif')
