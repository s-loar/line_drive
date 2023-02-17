defmodule LineDrive.FakeNoteApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_add_note(%{body_params: %{"content" => "Met them at such and such event"}} = conn) do
    response_body = ~s"""
    {
      "success": true,
      "data": {
          "id": 1,
          "user_id": 123,
          "deal_id": null,
          "person_id": null,
          "org_id": 1,
          "lead_id": null,
          "content": "Met them at such and such event",
          "add_time": "2023-02-14 21:15:32",
          "update_time": "2023-02-14 21:15:32",
          "active_flag": true,
          "pinned_to_deal_flag": false,
          "pinned_to_person_flag": false,
          "pinned_to_organization_flag": true,
          "pinned_to_lead_flag": false,
          "last_update_user_id": null,
          "organization": {
              "name": "Mecklem, LLC"
          },
          "person": null,
          "deal": null,
          "lead": null,
          "user": {
              "email": "person@launchscout.com",
              "name": "Person",
              "icon_url": null,
              "is_you": true
          }
      }
    }
    """

    conn
    |> send_resp(201, response_body)
  end

  def handle_get_all_org_notes(conn, %{"org_id" => _org_id}) do
    response_body = ~s"""
    {
      "success": true,
      "data": [
          {
              "id": 2,
              "user_id": 123,
              "deal_id": null,
              "person_id": null,
              "org_id": 1,
              "lead_id": null,
              "content": "Met them at such and such event",
              "add_time": "2023-02-14 21:15:32",
              "update_time": "2023-02-14 21:15:32",
              "active_flag": true,
              "pinned_to_deal_flag": false,
              "pinned_to_person_flag": false,
              "pinned_to_organization_flag": true,
              "pinned_to_lead_flag": false,
              "last_update_user_id": null,
              "organization": {
                  "name": "Mecklem, LLC"
              },
              "person": null,
              "deal": null,
              "lead": null,
              "user": {
                  "email": "person@launchscout.com",
                  "name": "Person",
                  "icon_url": null,
                  "is_you": false
              }
          },
          {
            "id": 1,
            "user_id": 123,
            "deal_id": null,
            "person_id": null,
            "org_id": 1,
            "lead_id": null,
            "content": "Talked with them and they told me they are using elixir",
            "add_time": "2023-02-14 20:58:31",
            "update_time": "2023-02-14 21:13:18",
            "active_flag": true,
            "pinned_to_deal_flag": false,
            "pinned_to_person_flag": false,
            "pinned_to_organization_flag": false,
            "pinned_to_lead_flag": false,
            "last_update_user_id": null,
            "organization": {
                "name": "Mecklem, LLC"
            },
            "person": null,
            "deal": null,
            "lead": null,
            "user": {
                "email": "person@launchscout.com",
                "name": "Person",
                "icon_url": null,
                "is_you": false
            }
        }
      ],
      "additional_data": {
          "pagination": {
              "start": 0,
              "limit": 2,
              "more_items_in_collection": true,
              "next_start": 3
          }
      }
    }
    """

    conn
    |> send_resp(200, response_body)
  end
end
