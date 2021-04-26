"""empty message

Revision ID: bd5d03176611
Revises: 1880f3e6b81b
Create Date: 2021-02-20 14:13:33.249397

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'bd5d03176611'
down_revision = '1880f3e6b81b'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint('Expert_email_key', 'Expert', type_='unique')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_unique_constraint('Expert_email_key', 'Expert', ['email'])
    # ### end Alembic commands ###
