defmodule VPE do
  require Logger

  def run do
    options = [
      endpoints: "http://127.0.0.1:8529",
      username: "root",
      password: "",
      pool_size: 1,
      show_sensitive_data_on_connection_error: true
    ]

    {:ok, conn} = Arangox.start_link(options)

    body = %{
      "action" => "function (){return true;}",
      "params" => %{
        "changes" => [
          %{
            "nodeType" => "C",
            "operationType" => "V",
            "nodeId" => "00000000-0000-0000-0000-000000000000",
            "value" => %{
              "createdBy" => "00000000-0000-0000-0000-000000000000",
              "createdAt" => 1_234_567_890_123,
              "updatedBy" => "00000000-0000-0000-0000-000000000000",
              "updatedAt" => 1_234_567_890_123,
              "state" => "XXXXXXXX",
              "name" => "XXX",
              "hidden" => true
            }
          }
        ]
      },
      "collections" => %{}
    }

    response = Arangox.post(conn, "/_api/transaction", body)

    Logger.info(inspect(response, pretty: true))
  end
end
