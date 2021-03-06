"""empty message

Revision ID: 86f0b6cd1e59
Revises: f63511ab384f
Create Date: 2021-02-14 09:04:40.785713

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '86f0b6cd1e59'
down_revision = 'f63511ab384f'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('suivi_prospect', sa.Column('prospect_id', sa.Integer(), nullable=True))
    op.drop_constraint('suivi_prospect_prospect_fkey', 'suivi_prospect', type_='foreignkey')
    op.create_foreign_key(None, 'suivi_prospect', 'prospect', ['prospect_id'], ['id'], onupdate='CASCADE', ondelete='CASCADE')
    op.drop_column('suivi_prospect', 'prospect')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('suivi_prospect', sa.Column('prospect', sa.INTEGER(), autoincrement=False, nullable=True))
    op.drop_constraint(None, 'suivi_prospect', type_='foreignkey')
    op.create_foreign_key('suivi_prospect_prospect_fkey', 'suivi_prospect', 'prospect', ['prospect'], ['id'], onupdate='CASCADE', ondelete='CASCADE')
    op.drop_column('suivi_prospect', 'prospect_id')
    # ### end Alembic commands ###
