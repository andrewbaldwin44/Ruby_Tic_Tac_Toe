class String
  def red;            "\e[31m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end

  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
end
