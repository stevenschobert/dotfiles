require 'json'
require 'erb'
require 'open3'

config_file = File.expand_path("./hooks.json", File.dirname(__FILE__))
config = JSON.parse(File.read(config_file))

language = ARGV[0].downcase
hook = ARGV[1].downcase
file = ARGV[2]

unless config.key?(language)
  exit 0
end

unless File.exists?(file)
  return
end

def file_in_parent_tree(pattern, dir = File.dirname(ARGV[2]))
  while true
    path = File.join(dir, pattern)
    match = Dir.glob(path).first
    if match
      return match
    end
    next_dir = File.expand_path("..", dir)
    if dir == next_dir
      return nil
    end
    dir = next_dir
  end
end

lang_config = config[language]

unless lang_config.key?(hook)
  exit 0
end

hooks = lang_config[hook]

hooks.each do |h|
  on_success = h["on_success"]
  on_error = h["on_error"]
  command = ERB.new(h["command"]).result(binding)

  Open3.popen3(command) do |pin, pout, perr, wait_thr|
    result = pout.read
    err = perr.read
    status = wait_thr.value

    output = nil
    target = nil

    if status.success? && err == "" && on_success
      output = result
      target = on_success
    elsif (!status.success? || err != "") && on_error
      output = err == "" ? result : err
      target = on_error
    end

    if output
      title = ERB.new(target["title"]).result(binding)
      msg = ERB.new(target["message"]).result(binding)
      details = ERB.new(target["details"] || "").result(binding)
      puts "#{ msg }:::#{ details }:::#{ title }"
    end
  end
end

