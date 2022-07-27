class PgBase < ActiveRecord::Base
    self.abstract_class = true
    establish_connection DB_PG
end