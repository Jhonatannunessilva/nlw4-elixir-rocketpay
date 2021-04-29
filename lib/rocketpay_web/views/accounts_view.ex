defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account
  alias Rocketpay.Accounts.Transactions.Response, as: TransactionResponse

  def render("update.json", %{
        account: %Account{
          id: id,
          balance: balance
        }
      }) do
    %{
      message: "Balance changed successfully",
      account: %{
        id: id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{
        transaction: %TransactionResponse{
          from_account: %Account{
            id: from_account_id,
            balance: from_account_balance
          },
          to_account: %Account{
            id: to_account_id,
            balance: to_account_balance
          }
        }
      }) do
    %{
      message: "Transaction done successfully",
      transaction: %{
        from_account: %{
          id: from_account_id,
          balance: from_account_balance
        },
        to_account: %{
          id: to_account_id,
          balance: to_account_balance
        }
      }
    }
  end
end
