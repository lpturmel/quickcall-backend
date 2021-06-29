defmodule QuickcallWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use QuickcallWeb, :controller
      use QuickcallWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: QuickcallWeb

      import Plug.Conn
      import QuickcallWeb.Gettext
      alias QuickcallWeb.Router.Helpers, as: Routes
    end
  end

  # def view do
  #   quote do
  #     use Phoenix.View,
  #       root: "lib/quickcall_web/templates",
  #       namespace: QuickcallWeb

  #     # Import convenience functions from controllers
  #     import Phoenix.Controller,
  #       only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

  #     # Include shared imports and aliases for views
  #     unquote(view_helpers())
  #   end
  # end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  @spec channel :: {:__block__, [], [{:import, [...], [...]} | {:use, [...], [...]}, ...]}
  def channel do
    quote do
      use Phoenix.Channel
      import QuickcallWeb.Gettext
    end
  end

  # defp view_helpers do
  #   quote do
  #     # Use all HTML functionality (forms, tags, etc)
  #     use Phoenix.HTML

  #     # Import basic rendering functionality (render, render_layout, etc)
  #     import Phoenix.View

  #     import QuickcallWeb.ErrorHelpers
  #     import QuickcallWeb.Gettext
  #     alias QuickcallWeb.Router.Helpers, as: Routes
  #   end
  # end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
