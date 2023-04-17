# frozen_string_literal: true

CC = "gcc"

task :default => "saikoro"

file "saikoro" => "saikoro.o" do
  sh "#{CC} -o saikoro saikoro.o"
end

file "saikoro.o" => "saikoro.c" do
  sh "#{CC} -c saikoro.c"
end
