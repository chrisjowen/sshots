# defmodule CrawlerServer do


#   def start_link()  do
#     GenServer.start_link(__MODULE__, ["/"])
#   end

#   def push(pid, item) do
#     GenServer.cast(pid, {:push, item})
#   end

#   def pop(pid) do
#     GenServer.call(pid, :pop)
#   end


#   @impl true
#   def init(urls) do
#     {:ok, urls}
#   end

#   @impl true
#   def handle_call(:found, _from, [head | tail]) do
#     {:reply, head, tail}
#   end

#   @impl true
#   def handle_cast({:push, item}, state) do
#     {:noreply, [item | state]}
#   end
# end



# end
