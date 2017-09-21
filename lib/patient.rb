class Patient
  #iniitlize patient
  attr_reader :id
  attr_accessor :patient_name, :birthday


  def initialize (attr)
    @id = nil
    @patient_name = attr.fetch(:patient_name)
    @birthday = attr.fetch(:birthday)
  end
  #patient.all()
    # lists patient's
    def self.all()
      returned_patients = DB.exec("SELECT * FROM patients;")
      patients = []
      returned_patients.each() do |patient|
      patient_name = patient.fetch("patient_name")
      id = patient.fetch("id").to_i
      birthday = patient.fetch("birthday")
      patients.push(Patient.new({:patient_name => patient_name, :birthday => birthday}))
      end
      patients
    end

  # patient.save()
  def save()
    result = DB.exec("INSERT INTO patients (patient_name, birthday) VALUES ('#{@patient_name}', '#{@birthday}') RETURNING id;")
    # @id = result.first().fetch("id").to_i()
  end

  def ==(another_list)
    (self.patient_name.==another_list.patient_name).&(self.id.==another_list.id)
  end

  # patient.find(id or name?)

  #patient.view()
  #doctors see patients assigned to them

end
