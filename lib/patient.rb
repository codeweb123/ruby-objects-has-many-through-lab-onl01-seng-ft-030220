class Patient

  attr_accessor :name, :appointment, :doctor
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(doctor, date)
    Appointment.new(self, date, doctor)
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select { |apt| apt.patient == self }
  end

  def doctors
    appointments.map {|appointment| appointment.doctor}
  end
end
