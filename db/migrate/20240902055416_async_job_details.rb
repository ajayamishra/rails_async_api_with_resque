class AsyncJobDetails < ActiveRecord::Migration[7.0]
  def change
    create_table "async_job_progress_statuses", id: { type: :string, limit: 26 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
      t.bigint "partition_key", null: false, comment: "sequential number key for analysis", auto_increment: true
      t.string "job_id", limit: 36, null: false
      t.integer "total_items", null: false
      t.integer "pending", null: false
      t.integer "success", null: false
      t.integer "error", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "canceled", default: 0, null: false
      t.index ["job_id"], name: "index_async_job_progress_statuses_on_job_id"
      t.index ["partition_key"], name: "index_async_job_progress_statuses_on_partition_key"
    end

    create_table "async_job_requests", id: { type: :string, limit: 26 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
      t.bigint "partition_key", null: false, comment: "sequential number key for analysis", auto_increment: true
      t.string "job_id", limit: 36, null: false
      t.text "request", size: :medium, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["job_id"], name: "index_async_job_requests_on_job_id"
      t.index ["partition_key"], name: "index_async_job_requests_on_partition_key"
    end

    create_table "async_job_results", id: { type: :string, limit: 26 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
      t.bigint "partition_key", null: false, comment: "sequential number key for analysis", auto_increment: true
      t.string "job_id", limit: 36, null: false
      t.integer "job_sub_id", null: false
      t.text "response", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "status", limit: 1, null: false
      t.integer "code", limit: 2
      t.index ["job_id", "job_sub_id"], name: "index_async_job_results_on_job_id_and_job_sub_id", unique: true
      t.index ["job_id"], name: "index_async_job_results_on_job_id"
      t.index ["partition_key"], name: "index_async_job_results_on_partition_key"
    end

    create_table "async_job_statuses", primary_key: "job_id", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
      t.bigint "partition_key", null: false, comment: "sequential number key for analysis", auto_increment: true
      t.string "job_type", limit: 100, null: false
      t.integer "status", limit: 1, null: false
      t.string "message"
      t.string "previous_job_id"
      t.boolean "is_re_sync", default: false
      t.datetime "expires_at", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "resque_job_id", limit: 36
      t.index ["job_id"], name: "index_async_job_statuses_on_job_id"
      t.index ["partition_key"], name: "index_async_job_statuses_on_partition_key"
    end
  end
end
