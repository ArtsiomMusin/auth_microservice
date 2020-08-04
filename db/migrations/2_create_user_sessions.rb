Sequel.migration do
  change do
    create_table(:user_sessions) do
      primary_key :id, type: :Bignum
      column :uuid, String, null: false
      foreign_key :user_id, :users
      column :created_at, 'timestamp(6)', null: false
      column :updated_at, 'timestamp(6)', null: false
    end
  end
end
