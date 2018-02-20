class NotificationJob < ApplicationJob
  def perform(message)
    # Send out the email notification for the message
    if message.sending?
      message.complete!
      puts "SENT NOTIFICATIONS!"
    end
  end
end
