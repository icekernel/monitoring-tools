
def slug_string(string):
  return string.replace('.', '_')

class FilterModule(object):
    ''' A filter to slugify a string. '''
    def filters(self):
        return {
            'slug' : slug_string,
        }
