module JSONAPI
  class OperationResult
    attr_accessor :code
    attr_accessor :meta
    attr_accessor :links
    attr_accessor :options

    def initialize(code, options = {})
      @code = code
      @options = options
      @meta = options.fetch(:meta, {})
      @links = options.fetch(:links, {})
    end
  end

  class ErrorsOperationResult < OperationResult
    attr_accessor :errors

    def initialize(code, errors, options = {})
      @errors = errors
      super(code, options)
    end
  end

  class ResourceOperationResult < OperationResult
    attr_accessor :resource

    def initialize(code, resource, options = {})
      @resource = resource
      super(code, options)
    end
  end

  class ResourcesOperationResult < OperationResult
    attr_accessor :resources, :pagination_params, :record_count

    def initialize(code, resources, options = {})
      @resources = resources
      @pagination_params = options.fetch(:pagination_params, {})
      @record_count = options[:record_count]
      super(code, options)
    end
  end

  class LinksObjectOperationResult < OperationResult
    attr_accessor :parent_resource, :association

    def initialize(code, parent_resource, association, options = {})
      @parent_resource = parent_resource
      @association = association
      super(code, options)
    end
  end
end
