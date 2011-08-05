/*
 * Copyright 2007-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
  author: Bhagwat  Kumar bhagwat(at)intelligrape(dot)com
 */
package com.fileTreeTest

class FileFolderController {

    def index = {
        [basePath: '/home/bhagwat']
    }
    def generateFileList = {
        println "Params got : " + params
        params.dir = params.dir.decodeURL() // as the space is changed to %20, same for other special chars e.g. E:\\ converts to
        String dir = params?.dir
        if (!dir.endsWith(File.separator)) {
            dir += File.separator
        }
        File rootDir = new File(dir)
        List<File> dirList = [], fileList = []
        if (rootDir.exists()) {
            List<File> filteredFileList = rootDir.listFiles().findAll {!it.hidden}.sort {it.name}
            dirList = filteredFileList.findAll {it.directory}
            fileList = filteredFileList - dirList
        }
        render(template: 'generateFileList', model: [dir: dir, dirList: dirList, fileList: fileList])
    }
}
