defmodule CacheUtils do
  @moduledoc false

  defmacro get_cache_or(cache_key, map_key, do: block) do
    quote do
      c_key = unquote(cache_key)
      m_key = unquote(map_key)

      case Cachex.exists?(c_key, m_key) do
        {:ok, false} ->
          value = unquote(block)
          Cachex.put!(c_key, m_key, value)
          value

        {:ok, true} ->
          Cachex.get!(c_key, m_key)
      end
    end
  end

  defmacro get_cache_or(cache_key, map_key, do: block, after: after_block) do
    quote do
      c_key = unquote(cache_key)
      m_key = unquote(map_key)

      case Cachex.exists?(c_key, m_key) do
        {:ok, false} ->
          value = unquote(block)
          Cachex.put!(c_key, m_key, value)
          unquote(after_block)
          value

        {:ok, true} ->
          Cachex.get!(c_key, m_key)
      end
    end
  end
end
