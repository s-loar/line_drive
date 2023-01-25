defmodule LineDrive.FakeLeadApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_search_leads(conn, %{"term" => "farkel"}) do
    response_body = ~s"""
    {
      "success": true,
      "data": {
          "items": [
              {
                  "result_score": 0.99348,
                  "item": {
                      "id": "d8648e28-debe-45c8-9725-4e742bfbf2c4",
                      "type": "lead",
                      "title": "Farkel Deal Lead",
                      "owner": {
                          "id": 17120881
                      },
                      "person": {
                          "id": 7,
                          "name": "Steve Farkel"
                      },
                      "organization": null,
                      "phones": [],
                      "emails": [],
                      "custom_fields": [],
                      "notes": [],
                      "value": 150000,
                      "currency": "USD",
                      "visible_to": 3,
                      "is_archived": false
                  }
              }
          ]
      },
      "additional_data": {
          "pagination": {
              "start": 0,
              "limit": 50,
              "more_items_in_collection": false
          }
      }
    }
    """

    conn
    |> send_resp(200, response_body)
  end

  def handle_get_lead(conn, %{"id" => "d8648e28-debe-45c8-9725-4e742bfbf2c4"}) do
    response_body = ~s"""
    {
      "success": true,
      "data": {
          "id": "d8648e28-debe-45c8-9725-4e742bfbf2c4",
          "title": "Farkel Deal Lead",
          "owner_id": 17120881,
          "creator_id": 17120881,
          "label_ids": [],
          "value": {
              "amount": 150000,
              "currency": "USD"
          },
          "expected_close_date": "2023-03-01",
          "person_id": 7,
          "organization_id": null,
          "is_archived": false,
          "source_name": "API",
          "was_seen": false,
          "next_activity_id": null,
          "add_time": "2023-01-23T19:42:58.050Z",
          "update_time": "2023-01-23T19:42:58.050Z",
          "visible_to": "3",
          "cc_email": "launchscout-sandbox@pipedrivemail.com"
      }
    }
    """

    conn
    |> send_resp(200, response_body)
  end

  def handle_create_lead(%{body_params: %{"title" => title}} = conn) do
    response_body = ~s"""
    {
      "success": true,
      "data": {
          "id": "d8648e28-debe-45c8-9725-4e742bfbf2c4",
          "title": "Farkel Deal Lead",
          "owner_id": 17120881,
          "creator_id": 17120881,
          "label_ids": [],
          "value": {
              "amount": 150000,
              "currency": "USD"
          },
          "expected_close_date": null,
          "person_id": 7,
          "organization_id": null,
          "is_archived": false,
          "source_name": "API",
          "was_seen": false,
          "next_activity_id": null,
          "add_time": "2023-01-23T19:42:58.050Z",
          "update_time": "2023-01-23T19:42:58.050Z",
          "visible_to": "3",
          "cc_email": "launchscout-sandbox@pipedrivemail.com"
      }
    }
    """

    conn
    |> send_resp(201, response_body)
  end
end