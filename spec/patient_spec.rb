require('rspec')
require('pg')
require('patient')
require('spec_helper')

DB = PG.connect({:dbname => 'office'})

describe(Patient) do
  describe('.all') do
    it('is empty at first') do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe('#initialize') do
    it('will take input from user') do
    patient = Patient.new({:patient_name => 'Grim Reaper', :birthday => '1818-05-07'})
    expect(patient.patient_name).to(eq('Grim Reaper'))
    end
  end

  describe("#==") do
  it("is the same patient if it has the same name and birthday") do
    patient1 = Patient.new({:patient_name => 'Grim Reaper', :birthday => '1818-05-07'})
    patient2 = Patient.new({:patient_name => 'Grim Reaper', :birthday => '1818-05-07'})
    expect(patient1).to(eq(patient2))
  end
end

  describe('#save') do
    it('will save inputted information') do
    input = Patient.new({:patient_name => 'Grim Reaper', :birthday => '1818-05-07'})
    input.save()
    expect(Patient.all).to(eq([input]))
    end
  end

end
