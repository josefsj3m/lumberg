# AllcPanel UAPI
# https://documentation.cpanel.net/display/DD/UAPI+Functions+-+Email%3A%3Adelete_pop
# To implement other UAPI Call look at the above link for the name and create the method.
module Lumberg
  module Cpanel
    module Uapi
      class Email < UapiBase
        # Public: This function returns an email account's username or address.
        #
        # options - Hash options for API call params (default: {}):
        #   :account  - The email address to return the mail account's username.
        #               Alternately, the mail account username to return the email address.
        #
        #               If you do not include this parameter, the function returns All Mail On The Account, or a blank value.
        #   :display  - Include this parameter to cause the function to return All Mail On The Account if the account
        #               parameter is blank or does not exist.
        #
        #               If you do not include this parameter and the account value is blank or does not exist, the function
        #               returns a blank data value.
        #
        # Returns Hash API response.
        def account_name(options = {})
          perform_request(
            options.merge(
              api_function: "account_name",
              api_module: 'Email'
            )
          )
        end

        # Public: Add an Email POP account.
        #
        # options - Hash options for API call params (default: {}):
        #   :domain   - String domain for the email account.
        #   :email    - String local part of email address. "user" if
        #               "user@domain".
        #   :password - String password for email account.
        #   :quota    - Integer disk space quota in MB, 0 for unlimited.
        #   :send_welcome_email - Boolean Whether to send client configuration instructions to the account. Defaults to 0
        #                         1 - Send the instructions.
        #                         0 - Do not send the instructions.
        #   :skip_update_db - Boolean Whether to skip the update of the email accounts database's cache. Defaults to 0.
        #                     1 - Skip the update.
        #                     2 - Perform the update.
        # Returns Hash API response.
        def add_email(options = {})
          perform_request(
              options.merge(
                  api_function: "add_pop",
                  api_module: 'Email'
              )
          )
        end

        # Public: This function deletes an email address.
        #
        # options - Hash options for API call params (default: {}):
        #   :email   - String The email account username or address.
        #   :flags   - String Whether to remove the mail account's home mail directory.
        #              If you do not specify a value, the function removes the mail account's home directory.
        #   :domain  - String The email account's domain. This parameter defaults to the cPanel account's main domain.
        #   :skip_quota  - Boolean Whether to modify the mail account's quota file. This parameter defaults to 0.
        #                  1 — Do not modify.
        #                  0 — Modify.
        #
        # Returns Hash API response.
        def delete_email(options = {})
          perform_request(
              options.merge(
                  api_function: "delete_pop",
                  api_module: 'Email'
              )
          )
        end
      end
    end
  end
end
