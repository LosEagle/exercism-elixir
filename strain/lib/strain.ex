defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    Enum.reduce(
      list,
      [],
      fn element, accumulator ->
        is_valid = fun.(element)

        if is_valid do
          accumulator ++ [element]
        else
          accumulator
        end
      end
    )
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    Enum.reduce(
      list,
      [],
      fn element, accumulator ->
        is_invalid = !fun.(element)

        if is_invalid do
          accumulator ++ [element]
        else
          accumulator
        end
      end
    )
  end
end
