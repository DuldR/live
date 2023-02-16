defmodule Pento.AnswerDeskFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pento.AnswerDesk` context.
  """

  @doc """
  Generate a faq.
  """
  def faq_fixture(attrs \\ %{}) do
    {:ok, faq} =
      attrs
      |> Enum.into(%{
        answer: "some answer",
        question: "some question",
        vote: 42
      })
      |> Pento.AnswerDesk.create_faq()

    faq
  end
end
