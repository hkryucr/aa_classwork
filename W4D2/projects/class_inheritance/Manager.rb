require_relative "Employee.rb"

class Manager < Employee
    attr_reader :subordinates
    def initialize(name, salary, title, boss)
        super(name, salary, title, boss)
        @subordinates = []
    end

    def add_employee(employee)
        subordinates << employee
        self.boss.add_employee(employee) if boss != nil

    end

    def bonus(multiplier)
        total_salary = 0
        subordinates.each do |subordinate|
            total_salary += subordinate.salary
        end
        total_salary * multiplier
    end
end


ned = Manager.new("Ned", 1000000, "Founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
p ned.subordinates
# Darren	\$78,000	TA Manager	Ned

# ned = Employee.new(Ned	\$1,000,000	Founder	nil)

