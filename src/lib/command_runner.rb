class CommandRunner
  def self.run(commands)
    commands.each do |cmd|
      p "#{cmd}"

      `#{cmd}`
    end
  end
end