"""empty message

Revision ID: 4fd063d3431e
Revises: 78d273da62ed
Create Date: 2021-12-21 10:27:17.240295

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision = '4fd063d3431e'
down_revision = '78d273da62ed'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('Agenda')
    op.drop_table('Facturation')
    op.drop_table('Agenda_expert')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('Agenda_expert',
    sa.Column('id', sa.INTEGER(), server_default=sa.text('nextval(\'"Agenda_expert_id_seq"\'::regclass)'), autoincrement=True, nullable=False),
    sa.Column('agenda_taken', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('Participant_invité', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('validation', sa.BOOLEAN(), autoincrement=False, nullable=True),
    sa.Column('visibility', sa.BOOLEAN(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['Participant_invité'], ['Expert.id'], name='Agenda_expert_Participant_invité_fkey', onupdate='CASCADE', ondelete='CASCADE'),
    sa.ForeignKeyConstraint(['agenda_taken'], ['Agenda.id'], name='Agenda_expert_agenda_taken_fkey', onupdate='CASCADE', ondelete='CASCADE'),
    sa.PrimaryKeyConstraint('id', name='Agenda_expert_pkey')
    )
    op.create_table('Facturation',
    sa.Column('id', sa.INTEGER(), server_default=sa.text('nextval(\'"Facturation_id_seq"\'::regclass)'), autoincrement=True, nullable=False),
    sa.Column('Facture_no', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('Date_', postgresql.TIMESTAMP(), autoincrement=False, nullable=False),
    sa.Column('Pays', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Destinataire', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('expediteur', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('Montant', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('TVA', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Total', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Type', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Proprietaire', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('Locataire', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('Ville', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Surface', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Tarif', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Appt_Pav', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Visibility', sa.BOOLEAN(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['Destinataire'], ['Client.id'], name='Facturation_Destinataire_fkey'),
    sa.ForeignKeyConstraint(['Locataire'], ['Client.id'], name='Facturation_Locataire_fkey'),
    sa.ForeignKeyConstraint(['Proprietaire'], ['Client.id'], name='Facturation_Proprietaire_fkey'),
    sa.ForeignKeyConstraint(['expediteur'], ['Expert.id'], name='Facturation_expediteur_fkey'),
    sa.PrimaryKeyConstraint('id', name='Facturation_pkey')
    )
    op.create_table('Agenda',
    sa.Column('id', sa.INTEGER(), server_default=sa.text('nextval(\'"Agenda_id_seq"\'::regclass)'), autoincrement=True, nullable=False),
    sa.Column('Ref_agenda_date', postgresql.TIMESTAMP(), autoincrement=False, nullable=True),
    sa.Column('client_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('Organisateur', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('Titre_du_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Adresse1_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Adresse2_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Code_postal_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Ville_du_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Date_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Heure_début_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Heure_fin_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Date_Rdv_annulé', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Informations_reservees_service_planification', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Informations_generales', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Informations_de_suivi_de_Rdv', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('Chemin_de_fichier_joint', sa.VARCHAR(), autoincrement=False, nullable=True),
    sa.Column('visibility', sa.BOOLEAN(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['Organisateur'], ['Expert.id'], name='Agenda_Organisateur_fkey', onupdate='CASCADE', ondelete='CASCADE'),
    sa.ForeignKeyConstraint(['client_id'], ['Client.id'], name='Agenda_client_id_fkey', onupdate='CASCADE', ondelete='CASCADE'),
    sa.PrimaryKeyConstraint('id', name='Agenda_pkey')
    )
    # ### end Alembic commands ###