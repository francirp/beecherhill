# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130621165752) do

  create_table "budgets", :force => true do |t|
    t.string   "year"
    t.integer  "total_expenses"
    t.integer  "revenue_generating_wages"
    t.float    "target_profit_percent"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.boolean  "is_active"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.string   "ownership"
    t.string   "revenue"
    t.string   "employees"
    t.string   "industry"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "consultant_roles", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "search_id"
    t.integer  "budgeted_hours"
    t.integer  "actual_hours"
    t.integer  "actual_cost"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.float    "percent_attributable"
    t.string   "role"
  end

  create_table "employee_budgets", :force => true do |t|
    t.integer  "budget_id"
    t.integer  "base_salary"
    t.integer  "annual_salary_paid"
    t.integer  "projected_revenue"
    t.integer  "percent_revenue_generating"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "employee_id"
  end

  create_table "employees", :force => true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "category"
    t.integer  "current_salary"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.float    "percent_revenue_generating"
    t.float    "factor_goal"
    t.integer  "start_month"
    t.integer  "days_off"
    t.float    "hours_per_day"
    t.string   "full_name"
    t.string   "first_initial_name"
    t.string   "initials"
  end

  create_table "searches", :force => true do |t|
    t.string   "reference_num"
    t.integer  "client_id"
    t.string   "title"
    t.string   "function"
    t.string   "level"
    t.date     "search_start_date"
    t.date     "engagement_letter_signed_date"
    t.string   "be_lead"
    t.string   "source"
    t.string   "introduction"
    t.integer  "salary"
    t.float    "target_bonus_percent"
    t.float    "fee_percent"
    t.string   "status"
    t.string   "reason_closed"
    t.text     "notes"
    t.string   "name_of_hire"
    t.date     "signed_offer_date"
    t.date     "placement_start_date"
    t.integer  "signing_bonus"
    t.string   "equity"
    t.string   "network"
    t.string   "introduced_by"
    t.string   "relocation_from"
    t.string   "relocation_to"
    t.string   "diversity"
    t.string   "gender"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.date     "placement_end_date"
    t.boolean  "new_client"
  end

  create_table "users", :force => true do |t|
    t.integer  "company_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "employee_id"
  end

end
