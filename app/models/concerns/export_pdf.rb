# frozen_string_literal: true

# module ExportPdf
module ExportPdf
  extend ActiveSupport::Concern

  # module ClassMethods
  module ClassMethods
    def to_pdf
      require 'prawn'
      require 'prawn/table'

      options = { position: :center, column_widths: [300, 300], width: 600 }
      header = %w[ID Title]
      data = all.map { |post| [post.id, post.title] }
      Prawn::Document.new do
        text 'Export des posts', align: :center, size: 18, style: :bold
        table([header, *data], header: true, **options)
      end.render
    end
  end
end