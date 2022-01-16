class Experience < ApplicationRecord
    belongs_to :profile
    
    has_many(:projects, dependent: :destroy)
    accepts_nested_attributes_for(:projects, reject_if: :reject_project_create, allow_destroy: true)

    
    def reject_project_create(project)
        project[:title].blank? or project[:url].blank? or project[:tech_stack].blank?
    end
end
