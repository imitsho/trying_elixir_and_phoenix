defmodule Depot do
  @moduledoc """
  Модуль для запуска Tram.
  """

  def route do
    Lesson4Tram.start_link()
  end
end
