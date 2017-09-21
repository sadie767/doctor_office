class Doctor
  attr_reader :id, :specialty
  attr_accessor :doctor_name
  #iniitlize doctor
  def initialize(attributes)
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
    @doctor_name = attributes.fetch(:doctor_name)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      doctor_name = doctor.fetch("doctor_name")
      id = doctor.fetch("id").to_i
      specialty = doctor.fetch("specialty")
      doctors.push(Doctor.new({:doctor_name => doctor_name, :specialty => specialty, :id => id}))
    end
    doctors
  end

  # doctor.save()
  def save()
    result = DB.exec("INSERT INTO doctors (doctor_name, specialty) VALUES ('#{@doctor_name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_list)
    (self.doctor_name.==another_list.doctor_name).&(self.id.==another_list.id)
  end
  # doctor.find(id or doctor_name?)

  #doctor.assign()
  #send doctor foreign key to patient
end
