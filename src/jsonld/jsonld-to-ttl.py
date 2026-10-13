import json

from pathlib import Path
from pyld import jsonld
from rdflib import Graph
from rdflib.namespace import Namespace, DCTERMS, FOAF, PROV

datastory_context = None
with open('datastory-context.json') as f:
    datastory_context = json.load(f)

metadata_context = None
with open('metadata-context.json') as f:
    metadata_context = json.load(f)

for json_path in Path('../../example/localhost.data/').glob('*/jsonld/datastory.json'):
    with open(json_path) as f:
        document = json.load(f)
        document['@context'] = datastory_context['@context']

        if 'metadata' in document:
            document['metadata']['@context'] = metadata_context['@context']

        if 'blocks' in document:
            for block in document['blocks']:
                if 'metadata' in block:
                    block['metadata']['@context'] = metadata_context['@context']

        if 'provenance' in document:
            document['provenance']['@context'] = 'https://openprovenance.org/prov-jsonld/context.jsonld'

        nquads = jsonld.to_rdf(document, {'format': 'application/n-quads'})

        graph = Graph()
        graph.bind('dcterms', DCTERMS)
        graph.bind('foaf', FOAF)
        graph.bind('prov', PROV)
        graph.bind('ds', Namespace('https://stories.clariah.nl#'))

        graph.parse(data=nquads, format='nquads')
        graph.serialize(
            destination=json_path.parent / 'datastory.ttl',
            format='turtle',
            encoding='utf-8',
        )
