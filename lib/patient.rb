class Patient

  attr_accessor :name, :appointment, :doctor
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(date, doctor)
    Appointment.new(date, doctor, self)
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
