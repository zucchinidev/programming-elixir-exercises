defmodule RaiseException do
  def ok!(parameter) do
    case parameter do
      { :ok, _ } -> parameter
      { :error, message } -> raise "#{message}"
    end
  end  
end