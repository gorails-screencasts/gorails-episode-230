class Message < ApplicationRecord
  belongs_to :user

  include AASM

  aasm column: :state do
    state :draft, initial: true
    state :sending, :sent

    event :publish do
      transitions from: :draft, to: :sending
      after do
        job = NotificationJob.set(wait: 30.seconds).perform_later(self)
        update(job_id: job.provider_job_id)
      end
    end

    event :complete do
      transitions from: :sending, to: :sent
    end

    event :undo do
      transitions from: :sending, to: :draft
      before do
        Sidekiq::ScheduledSet.new.find_job(job_id).delete
        self.job_id = nil
      end
    end
  end
end
