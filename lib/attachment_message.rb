class AttachmentMessage

  def initialize recipient_id, content
    @recipient_id, @content = recipient_id, content
  end

  def list_format
    {
      recipient: { id: @recipient_id },
      message: { 
        attachment: {
          type: 'template',
          payload: {
            template_type: 'list',
            top_element_style: 'compact',
            elements: @content,
            buttons: [
              { title: "View More", type: 'postback', payload: 'view_more' }
            ]
          }
        }
      }
    }
  end

  def button_format
    {
      recipient: { id: @recipient_id },
      message: { 
        attachment: {
          type: 'template',
          payload: {
            template_type: 'button',
            text: 'Make your picks',
            buttons: [
              { title: @content[0], type: 'postback', payload: 'SELECT_PICK' },
              { title: @content[1], type: 'postback', payload: 'SELECT_PICK' },
              { title: "Next", type: 'postback', payload: 'NEXT' }
            ]
          }
        }
      }
    }
  end


end