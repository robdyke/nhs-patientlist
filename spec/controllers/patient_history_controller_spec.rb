require 'spec_helper'

describe PatientHistoryController do
  login_user

  let(:patient) { Patient.make! }

  describe "GET show" do

    context "for a patient that exists" do

      it "is successful" do
        get :show, id: patient.id
        response.should be_successful
        response.should render_template(:show)
      end

      it "assigns the correct patient" do
        get :show, id: patient.id
        controller.patient.should == patient
      end

      it "assigns an array of audit presenters" do
        ToDoItem.make! patient: patient
        get :show, id: patient.id

        assigns(:audits).should be_kind_of(Array)
        assigns(:audits).first.audit.should == patient.associated_audits.first
      end

    end

    context "for a patient that doesn't exist" do

      it "redirects" do
        get :show, id: 0
        response.should redirect_to(root_path)
      end

    end

  end

end
