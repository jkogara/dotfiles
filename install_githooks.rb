#!/usr/bin/env ruby
require 'pry'
require 'fileutils'

class InstallGithooks
  GIT_HOOKS_DIR = File.join(__dir__, "./git_template/hooks/")
  TARGET_GIT_HOOKS_DIR = ".git/hooks"

  def run
    unless File.exist?(TARGET_GIT_HOOKS_DIR)
      puts "git is not initialized in this directory, exiting"
      return
    end
    puts "Installing hooks"
    Dir.glob("#{GIT_HOOKS_DIR}*").each do |hook|
      target_file = File.join(TARGET_GIT_HOOKS_DIR, hook.split('/').last)
      if hook.to_s.match?(/(pre|post)-/)
        if File.exist?(target_file)
          File.open(target_file, 'a') do |file|
            file.puts "\n\n"
            file.puts "# installed hooks from dotfiles"
            file.puts File.read(hook).split("\n")[1..-1].join("\n")
          end
        else
          FileUtils.cp(hook, target_file)
        end
      else
        FileUtils.cp(hook, target_file)
      end
    end
  end
end

InstallGithooks.new.run
