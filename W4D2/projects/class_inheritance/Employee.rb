class Employee
    attr_reader :salary, :name, :title, :boss
    def initialize(name, salary, title, boss = nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        boss.add_employee(self) if boss != nil
    end

    def bonus (multiplier)
        salary * multiplier
    end
end