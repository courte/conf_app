# stromg_parameters installation
# Includes Forbidden Attributes Protection in all models
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)