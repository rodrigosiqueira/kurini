require_relative 'preparser.rb'



class RubyPreParser < PreParser

  
  def initialize
    @LINE_CONTINUATION_CHARS = ['.', ',']
    @on_multiline_comment = false
  end

  def remove_comments(line)
    @on_multiline_comment = true if line =~ /^=begin(.*?)/
    if @on_multiline_comment
      pre_parsed_line = ''
    else
      comment_regex = /(?<non_comm>[^#]*)#.*/
      match = line.match(comment_regex)
      pre_parsed_line = match.nil? ? line : match['non_comm']
    end
    @on_multiline_comment = false if line =~ /^=end/
    return pre_parsed_line
  end

  def zip_multiple_lines_command(lines)
    zipped_lines = []
    curr_line = ""
    append_next = true
    for line in lines
      if append_next
        curr_line << line
      else
        zipped_lines.push(curr_line)
        curr_line = line
      end
      if @LINE_CONTINUATION_CHARS.include?(line[-1])
        append_next = true
      else
        append_next = false
      end
    end
    zipped_lines.push(curr_line)
    return zipped_lines
  end

  def split_multiple_command_line(line)
    return line
  end
end
