class CreateConcretes < ActiveRecord::Migration[7.0]
  def change
    create_table :concretes do |t|
      t.string :rmc_site_concrete
      t.string :structure
      t.string :grade

      t.timestamps
    end
  end
end
