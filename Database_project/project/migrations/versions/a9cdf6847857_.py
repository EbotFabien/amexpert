"""empty message

Revision ID: a9cdf6847857
Revises: 1dcde88a77a7
Create Date: 2021-01-18 16:39:41.753681

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'a9cdf6847857'
down_revision = '1dcde88a77a7'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('Client', 'ZTF')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('Client', sa.Column('ZTF', sa.VARCHAR(), autoincrement=False, nullable=True))
    # ### end Alembic commands ###
