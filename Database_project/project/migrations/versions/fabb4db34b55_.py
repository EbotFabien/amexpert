"""empty message

Revision ID: fabb4db34b55
Revises: a9a9de29510d
Create Date: 2021-11-16 13:47:41.855258

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'fabb4db34b55'
down_revision = 'a9a9de29510d'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint('Client_login_key', 'Client', type_='unique')
    op.drop_column('Client', 'login')
    op.add_column('Expert', sa.Column('login', sa.String(), nullable=True))
    op.create_unique_constraint(None, 'Expert', ['login'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'Expert', type_='unique')
    op.drop_column('Expert', 'login')
    op.add_column('Client', sa.Column('login', sa.VARCHAR(), autoincrement=False, nullable=True))
    op.create_unique_constraint('Client_login_key', 'Client', ['login'])
    # ### end Alembic commands ###