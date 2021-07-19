defmodule WowCommunityApi.Auction do
  require CacheUtils

  @moduledoc """
  Auction APIs currently provide rolling batches of data about current auctions. Fetching auction dumps is a two-step process that involves checking a per-realm index file to determine if a recent dump has been generated and then fetching the most recently generated dump file (if necessary).
  This API resource provides a per-realm list of recently generated auction house data dumps.
  """

  @typedoc """
  Name of the realm.
  """
  @type realm :: String.t()

  @typedoc """
  Use cached data, or fetch and store if not in cache.
  """
  @type use_cache :: boolean()

  @doc """
  Gets all auctions for given realm.
  """
  @spec get_all_auctions_for_realm!(realm) :: [Auction.t()]
  @spec get_all_auctions_for_realm!(realm, use_cache) :: [Auction.t()]
  def get_all_auctions_for_realm!(realm, cache \\ true) do
    if cache do
      CacheUtils.get_cache_or :wow_auction_cache, realm do
        get_auctions!(realm)
      end
    else
      get_auctions!(realm)
    end
  end

  defp get_auctions!(realm) do
    WowApi.get("wow/auction/data/#{realm}")
    |> WowApi.handle_if_error!()
    |> get_url_from_auction_data!()
    |> get_auction_data_from_url!()
  end

  defp get_auction_data_from_url!(url) do
    HTTPoison.get(url)
    |> WowApi.handle_if_error!()
    |> ApiUtils.convert_body_to_struct!("auctions", Auction)
  end

  defp get_url_from_auction_data!(data) do
    data
    |> Poison.decode!()
    |> Map.get("files")
    |> List.first()
    |> Map.get("url")
  end
end
