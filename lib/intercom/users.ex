defmodule Intercom.Users do
  @type list_by_option :: :email | :tag_id | :segment_id

  @spec get(String.t()) :: Intercom.API.response()
  def get(id) do
    Intercom.API.call_endpoint(:get, "users/#{id}")
  end

  @spec get_by(user_id: String.t()) :: Intercom.API.response()
  def get_by(user_id: user_id) do
    Intercom.API.call_endpoint(:get, "users?user_id=#{user_id}")
  end

  @spec list :: Intercom.API.response()
  def list() do
    Intercom.API.call_endpoint(:get, "users")
  end

  @spec list_by([{list_by_option, String.t()}]) :: Intercom.API.response()
  def list_by(email: email) do
    Intercom.API.call_endpoint(:get, "users?email=#{email}")
  end

  def list_by(tag_id: tag_id) do
    Intercom.API.call_endpoint(:get, "users?tag_id=#{tag_id}")
  end

  def list_by(segment_id: segment_id) do
    Intercom.API.call_endpoint(:get, "users?segment_id=#{segment_id}")
  end

  @spec upsert(map()) :: Intercom.API.response()
  def upsert(user_data) when is_map(user_data) do
    Intercom.API.call_endpoint(:post, "users", user_data)
  end
end
